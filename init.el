(defvar my-os
  (cond ((eq system-type 'windows-nt) "windows")
                ((eq system-type 'darwin) "mac")
                ((eq system-type 'gnu/linux) "linux")
                (t "unknown")))

(defvar plugin-path
  (cond ((equal my-os "windows") "c:/emacs/plugins")
                ((equal my-os "mac") "~/Code/emacs/plugins")
                ((equal my-os "linux") "~/Code/emacs/plugins")
                (t "~/default")))

(defvar default-font
  (cond ((equal my-os "windows") "Cascadia Code 10")
                ((equal my-os "mac") "Monaco 15")
                ((equal my-os "linux") "Ubuntu Mono 14")
                (t "Monaco 15")))

(defvar default-spelling-program
  (cond ((equal my-os "windows") "ispell")
                ((equal my-os "mac") "/usr/local/bin/aspell")
                ((equal my-os "linux") "/usr/bin/aspell")
                (t "/usr/bin/aspell")))

(defvar default-notes-path
  (cond ((equal my-os "windows") "c:/orgnotes/")
                ((equal my-os "mac") "~/orgnotes/")
                ((equal my-os "linux") "~/orgnotes/")
                (t "~/orgnotes/")))

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
(setq ispell-program-name default-spelling-program)
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

(global-set-key (kbd "C-c n") 'create-or-open-note-for-todo)

(defun find-and-open-file-by-date (directory)
  "Check for a file in DIRECTORY with a date-based filename and open it if found."
  (let ((current-date (format-time-string "%Y-%m-%d"))
        (days-to-check 0)
        (found-file nil)
	(file-path nil)
	(is-today nil))
    (while (and (not found-file) (< days-to-check 7))
      (let* ((date-to-check (time-subtract (current-time) (days-to-time days-to-check)))
            (file-to-check (concat directory (format-time-string "%Y-%m-%d" date-to-check) ".org")))
        (when (file-exists-p file-to-check)
          (setq found-file t
		file-path file-to-check)
	  (if (equal current-date (format-time-string "%Y-%m-%d" date-to-check))
		(setq is-today t)
	      )))
      (setq days-to-check (1+ days-to-check)))
    (values found-file file-path is-today)))

(defun todays-notes (directory)
    (let ((result (find-and-open-file-by-date directory))
	  (today (format-time-string "%Y-%m-%d"))
	  (template-file (expand-file-name "todo-template.org" directory))
	  )
    (multiple-value-bind (file-found file-path is-today) result
	(if (eq file-found t)
	    (if (eq is-today t)
		(find-file file-path) ;; We have a file for today, just open it
	      (copy-file file-path (expand-file-name (concat today ".org") directory)) ;; We have an older file, copy it and open
	      (find-file (expand-file-name (concat today ".org") directory)))
	(copy-file template-file (expand-file-name (concat today ".org") directory)))))) ;; We have no file, copy from template


(global-set-key (kbd "C-c o") (lambda () (interactive) (todays-notes default-notes-path)))
