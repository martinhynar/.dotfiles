;; PACKAGE
;; ------------------------
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/scripts")
(add-to-list 'load-path "~/.emacs.d/git-libs/es-lib")


(defvar my-packages '(cider
		      smartparens
		      rainbow-delimiters
		      gist
		      smex
		      projectile
		      groovy-mode
		      markdown-mode
		      adoc-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; PARENS
;; ------------------------
(require 'smartparens)
(add-hook 'clojure-mode-hook       'smartparens-strict-mode)
(add-hook 'clojurescript-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook    'smartparens-strict-mode)
(require 'rainbow-delimiters)
(add-hook 'smartparens-mode-hook 'rainbow-delimiters-mode)
; Show matching parentheses
(show-paren-mode 1)

;; SMEX
;; ------------------------
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; PROJECTILE
;; ------------------------
(projectile-global-mode)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths)
(global-set-key (kbd "M-p") 'projectile-find-file)

;; LOOK AND FEEL
;; ------------------------
(load-theme 'dichromacy)
(global-linum-mode 1)
(tool-bar-mode nil)
(setq ring-bell-function 'ignore)
(set-face-attribute 'default nil :height 100)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)

;; Emacs prompts should accept "y" or "n" instead of the full word
(fset 'yes-or-no-p 'y-or-n-p)

;; TABS ARE EVIL
;; ------------------------
(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;; C-TAB to chenge active window (instead of C-x o)
;; ------------------------
(global-set-key [C-tab] 'other-window)
(defun org-mode-other-window-too ()
  (local-set-key [C-tab] 'other-window))
(add-hook 'org-mode-hook 'org-mode-other-window-too)

;; OCTAVE
;; ------------------------
(autoload 'octave-mode "octave-mod" nil t)
          (setq auto-mode-alist
                (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
                    (lambda ()
                      (abbrev-mode 1)
                      (auto-fill-mode 1)
                      (if (eq window-system 'x)
                          (font-lock-mode 1))))
;; Backup files
;; ------------------------
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

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


;; TRAMP
;; ------------------------
(require 'tramp)
(setq tramp-default-method "ssh")

;; GROOVY
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))

;; Markdown
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; AsciiDoc
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.asciidoc\\'" . adoc-mode))
(add-hook 'adoc-mode-hook 'cider-mode)

;; Clojure
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljx\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

;; Shell
;; ------------------------
(add-to-list 'auto-mode-alist '("\\.sh$" . shell-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-mode))

;  Enable eldoc - shows fn argument list in echo area
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; YASnippet
;; ------------------------
(add-to-list 'load-path "~/.emacs.d/git-packages/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/git-packages/yasnippet/snippets"
        ))

(yas-global-mode 1)
