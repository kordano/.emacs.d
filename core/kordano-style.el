;;; kordano-style.el --- MODE CONFIGURATION
;;; Commentary:
;;; Style configuration and visual helpers
;;; CODE:


(setq vc-follow-symlinks t)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; vim bindings
(add-to-list 'load-path "~/.emacs.d/libs/evil")
(require 'evil)
(evil-mode 1)

;; indentation
(setq-default indent-tabs-mode nil)
(setq standard-indent 2) 
(setq indent-tabs-mode nil)

;; scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; ui elements
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; highlighting
;(global-hl-line-mode 1)
;(global-hl-line-highlight)

(use-package eval-sexp-fu
  :ensure t
  :init
  (use-package highlight :ensure t)
  (setq eval-sexp-fu-flash-duration 0.3)
  :config
  (eval-sexp-fu-flash-mode 1))

;;(use-package rainbow-delimiters :ensure t :config (rainbow-delimiters-mode t))


(fset 'yes-or-no-p 'y-or-n-p)

(autoload 'enable-paredit-mode "paredit" t)

(show-paren-mode 1)

(setq show-paren-delay 0)

(defface paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey80")))
  "Face used to dim parentheses.")

(defun dim-brackets ()
  (font-lock-add-keywords nil '(("(\\|)" . 'paren-face)))
  (font-lock-add-keywords nil '(("{\\|}" . 'paren-face)))
  (font-lock-add-keywords nil '(("\\[\\|\\]" . 'paren-face))))


(add-hook 'emacs-lisp-mode-hook 'dim-brackets)
(add-hook 'clojure-mode-hook 'dim-brackets)
(add-hook 'js2-mode-hook 'dim-brackets)

(set-frame-font
 (case system-type
   ('darwin "Monaco 11")
   ('windows-nt "Consolas 11")
   ('gnu/linux "Source Code Pro 10")))
  
(use-package paredit :ensure t)

(use-package powerline :ensure t :config (powerline-default-theme))

;; theme

                                        ;(use-package base16-theme :ensure t)
                                        ;(load-theme 'base16-solarized-dark)
                                        ;(use-package color-theme-sanityinc-solarized :ensure t)
                                        ;(load-theme 'sanityinc-solarized-light)
                                        ;(use-package atom-one-dark-theme :ensure t :config (load-theme 'atom-one-dark))
                                        ;(use-package noctilux-theme :ensure t :config (load-theme 'noctilux))
                                        ;(use-package hydandata-light-theme :ensure t :config (load-theme 'hydandata-light))
                                        ;(use-package solarized-theme :ensure t :config (load-theme 'solarized-dark))
                                        ;(use-package cyberpunk-theme :ensure t :config (load-theme 'cyberpunk))
                                        ;(load-theme 'base16-monokai-dark)

(use-package moe-theme :ensure t
  :config
  (moe-dark)
  (powerline-moe-theme)
  (setq show-paren-style 'expression)
  ;(require 'moe-theme-switcher)
  )

(global-prettify-symbols-mode +1)

(provide 'kordano-style.el)
;;; kordano-modes.el ends here
