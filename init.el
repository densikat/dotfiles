(defvar my-os
  (cond ((eq system-type 'windows-nt) "windows")
                ((eq system-type 'darwin) "mac")
                (t "unknown")))

(defvar plugin-path
  (cond ((equal my-os "windows") "c:/emacs/plugins")
                ((equal my-os "mac") "~/Code/emacs/plugins")
                (t "~/default")))

(defvar default-font
  (cond ((equal my-os "windows") "Cascadia Code 10")
                ((equal my-os "mac") "Monaco 15")
                (t "Monaco 15")))

;; Fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Don't show the splash screen
(setq inhibit-startup-message t)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Theme
(load-theme 'deeper-blue t)

;; Bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-display-line-numbers-mode 1)

;; Font
(set-frame-font default-font)

;; Confirm before exit
(setq confirm-kill-emacs #'yes-or-no-p)

;; Plugins
(add-to-list 'load-path (format "%s/%s" plugin-path "evil"))
(add-to-list 'load-path (format "%s/%s" plugin-path "evil-org-mode"))
(add-to-list 'load-path (format "%s/%s" plugin-path "org-bullets"))

;; Org Mode
(require 'org)
(require 'org-bullets)
(setq org-hide-emphasis-markers t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Spelling
(setq ispell-program-name "/usr/local/bin/aspell") ;; TODO set this as a variable for platform independenc
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Enable Evil
(setq evil-want-C-i-jump nil) ;; Enable TAB in org mode
(require 'evil)
(require 'evil-org)
(evil-mode 1)
(setf evil-org-key-theme '(navigation insert textobjects additional))


;; Disable auto-save
(setq auto-save-default nil)

;; TODAYS NOTES
(defun create-daily-notes ()
  (interactive)
  (let* ((notes-dir "~/orgnotes/") ;; TODO set this as a variable for platform independenc
         (template-file (expand-file-name "template.org" notes-dir))
         (today (format-time-string "%Y-%m-%d"))
         (notes-file (expand-file-name (concat today ".org") notes-dir)))
    (copy-file template-file notes-file)
    (find-file notes-file)))

(global-set-key (kbd "C-c n") 'create-daily-notes)

(defun open-daily-notes ()
  (interactive)
  (let* ((notes-dir "~/orgnotes/") ;; TODO set this as a variable for platform independenc
         (template-file (expand-file-name "template.org" notes-dir))
         (today (format-time-string "%Y-%m-%d"))
         (notes-file (expand-file-name (concat today ".org") notes-dir)))
		(find-file notes-file)
		(if (file-exists-p notes-file)
			(with-current-buffer (find-file-noselect notes-file)
			  (org-copy-visible)
			  (with-current-buffer (find-file-noselect (expand-file-name (concat today ".org") notes-dir))
				(org-mode)
				(yank))))))

(global-set-key (kbd "C-c o") 'open-daily-notes)

(defun copy-previous-day-notes ()
  (interactive)
  (let* ((notes-dir "~/orgnotes/") ;; TODO set this as a variable for platform independenc
         (today (format-time-string "%Y-%m-%d"))
         (yesterday (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time 1))))
         (previous-day-notes-file (expand-file-name (concat yesterday ".org") notes-dir))
         (fallback-notes-file (expand-file-name (concat (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time 3))) ".org") notes-dir)))
    (if (file-exists-p previous-day-notes-file)
        (with-current-buffer (find-file-noselect previous-day-notes-file)
          (org-copy-visible)
          (with-current-buffer (find-file-noselect (expand-file-name (concat today ".org") notes-dir))
            (org-mode)
            (yank)))
      (message "Previous day's notes not found. Falling back to the notes from two days ago.")
      (when (file-exists-p fallback-notes-file)
        (with-current-buffer (find-file-noselect fallback-notes-file)
          (org-copy-visible)
          (with-current-buffer (find-file-noselect (expand-file-name (concat today ".org") notes-dir))
            (org-mode)
            (yank)))))))

(global-set-key (kbd "C-c y") 'copy-previous-day-notes)

(defun create-or-open-note-for-todo ()
  "Create or open a note file for the parent heading of the current TODO item."
  (interactive)
  (save-excursion
	(setq todo-pos (org-entry-beginning-position))
    (org-back-to-heading)
    (outline-up-heading 1)
    (let* ((parent-heading (nth 4 (org-heading-components)))
           (note-dir (expand-file-name (concat "~/orgnotes/" parent-heading))) ;; TODO set this as a variable for platform independenc
           (note-file (read-file-name "Note file name: " note-dir))
           (note-link (concat "[[" note-file "][Note]]")))
      (make-directory note-dir t)
      (goto-char todo-pos)
      (end-of-line)
      (insert " " note-link)
      (find-file note-file)
      (unless (file-exists-p note-file)
        (insert "#+TITLE: " note-file "\n\n"))
      (end-of-buffer)
      (unless (search-backward "#+END:" nil t)
        (insert "\n\n#+END:\n")))))

(global-set-key (kbd "C-c p") 'create-or-open-note-for-todo)
