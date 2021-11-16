;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Init use-package on non linux systems
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; SCRATCH

(setq inhibit-startup-message t)
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Set window fringe width
(menu-bar-mode -1) ; Disable the menu bar
(add-hook 'window-setup-hook 'toggle-frame-maximized t) ; Fullscreen
(setq confirm-kill-emacs 'y-or-n-p) ; Ask before quitting
(global-display-line-numbers-mode) ; Always display line numbers

;; ICONS

(use-package all-the-icons)
(setq doom-modeline-major-mode-icon t)

;; MODE LINE
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; DOOM THEME

(use-package doom-themes
  :init (load-theme 'doom-tomorrow-night t))

;; CLIPBOARD

(setq x-select-enable-clipboard t);; Commands to interact with the clipboard

(defun osx-copy (beg end)
  (interactive "r")
  (call-process-region beg end  "pbcopy"))

(defun osx-paste ()
  (interactive)
  (if (region-active-p) (delete-region (region-beginning) (region-end)) nil)
  (call-process "pbpaste" nil t nil))

(defun linux-copy (beg end)
  (interactive "r")
  (call-process-region beg end  "xclip" nil nil nil "-selection" "c"))

(defun linux-paste ()
  (interactive)
  (if (region-active-p) (delete-region (region-beginning) (region-end)) nil)
  (call-process "xsel" nil t nil "-b"))

(cond
 ((string-equal system-type "darwin") ; Mac OS X
  (define-key global-map (kbd "C-x C-w") 'osx-copy)
  (define-key global-map (kbd "C-x C-y") 'osx-paste))
 ((string-equal system-type "gnu/linux") ; linux
  (define-key global-map (kbd "C-x C-w") 'linux-copy)
  (define-key global-map (kbd "C-x C-y") 'linux-paste)))

;; FONTS

(set-face-attribute 'default nil :font "Fira Code Retina")
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina")
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell")
(set-face-attribute 'default nil :height (* 13 10));13pt
(set-face-attribute 'fixed-pitch nil :height (* 13 10));13pt
(set-face-attribute 'variable-pitch nil :height (* 13 10));13pt


;; EVIL MODE

(unless (package-installed-p 'evil) ; download
  (package-install 'evil))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; IVY

(use-package counsel
  :after ivy
  :bind*
  (("C-x C-f" . counsel-file-jump)
   )
  :config (counsel-mode))

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-delimiters which-key doom-themes doom-modeline use-package popup ivy-rich helm-core evil-collection counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; WHICH KEY

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
