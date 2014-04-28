(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/scripts")
(add-to-list 'load-path "~/.emacs.d/git-libs/es-lib")


(defvar my-packages '(cider
		      smartparens
		      rainbow-delimiters
		      gist
		      smex
		      projectile))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Show matching parentheses
(show-paren-mode 1)

; Parentheses
(require 'smartparens)
(add-hook 'clojure-mode-hook       'smartparens-strict-mode)
(add-hook 'clojurescript-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook    'smartparens-strict-mode)
(require 'rainbow-delimiters)
(add-hook 'smartparens-mode-hook 'rainbow-delimiters-mode)

; SMEX
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

; PROJECTILE
(projectile-global-mode)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths)
(global-set-key (kbd "M-p") 'projectile-find-file)

; Look and feel
(load-theme 'dichromacy)
(global-linum-mode 1)
(tool-bar-mode nil)
(setq ring-bell-function 'ignore)

; TABS ARE EVIL
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(highlight-tabs)
(highlight-trailing-whitespace)

; instead of C-x o
(global-set-key [C-tab] 'other-window)
(defun org-mode-other-window-too ()
  (local-set-key [C-tab] 'other-window))
(add-hook 'org-mode-hook 'org-mode-other-window-too)

; Octave settings
 (autoload 'octave-mode "octave-mod" nil t)
          (setq auto-mode-alist
                (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
                    (lambda ()
                      (abbrev-mode 1)
                      (auto-fill-mode 1)
                      (if (eq window-system 'x)
                          (font-lock-mode 1))))
; Backup files
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dichromacy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Jinja
(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.jinja$" . jinja2-mode))

(set-face-attribute 'default nil :height 100)

(require 'dirtree)

;;(require 'project-explorer)

(require 'tramp)
(setq tramp-default-method "ssh")
