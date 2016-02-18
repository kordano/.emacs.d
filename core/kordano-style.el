;;; kordano-style.el --- MODE CONFIGURATION
;;; Commentary:
;;; Style configuration and visual helpers
;;; CODE:


(setq vc-follow-symlinks t)
(prefer-coding-system 'utf-8)

;; vim bindings
(add-to-list 'load-path "~/.emacs.d/libs/evil")
(require 'evil)
(evil-mode 1)

;; indentation
(setq-default indent-tabs-mode nil)

;; scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; ui elements
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; highlighting
(global-hl-line-mode 1)
(global-hl-line-highlight)

(use-package eval-sexp-fu
  :ensure t
  :init
  (use-package highlight :ensure t)
  (setq eval-sexp-fu-flash-duration 0.3)
  :config
  (eval-sexp-fu-flash-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :config (rainbow-delimiters-mode t))

(fset 'yes-or-no-p 'y-or-n-p)

(autoload 'enable-paredit-mode "paredit" t)

(show-paren-mode 1)

(setq show-paren-delay 0)

(use-package paredit :ensure t)

;; theme

;(use-package base16-theme :ensure t)
;(load-theme 'base16-solarized-dark)

;(use-package color-theme-sanityinc-solarized :ensure t)
;(load-theme 'sanityinc-solarized-dark)

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark))


;(use-package cyberpunk-theme :ensure t :config (load-theme 'cyberpunk))



;;; kordano-modes.el ends here
