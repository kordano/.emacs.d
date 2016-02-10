;;; kordano-modes.el --- MODE CONFIGURATION
;;; Commentary:
;;; Configuration of different emacs modes
;;; CODE:


(defun add-all-hooks (mode hooks)
  (-map (lambda (hook) (add-hook mode hook)) hooks))

;;; emacs lisp
(defun emacs-mode-keys ()
  (local-set-key (kbd "\C-cj") 'eval-defun)
  (local-set-key (kbd "\C-ck") 'eval-last-sexp)
  (local-set-key (kbd "\C-cö") 'eval-buffer))

(defvar elisp-mode-hooks
  (list 'emacs-mode-keys
        'enable-paredit-mode
        'rainbow-delimiters-mode))

(add-all-hooks 'emacs-lisp-mode-hook elisp-mode-hooks)

;;; javascript
(use-package js2-mode :ensure t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("(not  )ode" . js2-mode))

(setq js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)

(defun js-disable-ident-tabs ()
  (set-variable 'ident-tabs-mode nil))

(defvar js2-mode-hooks
  (list 'js-disable-ident-tabs
        'electric-pair-mode
        'hs-minor-mode))

(add-all-hooks 'js2-mode-hook js2-mode-hooks)

;;; kordano-modes.el ends here
