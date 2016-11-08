;;; kordano-modes.el --- MODE CONFIGURATION
;;; Commentary:
;;; Configuration of different Emacs modes
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
        'highlight-symbol-mode
        'enable-paredit-mode))

(add-all-hooks 'emacs-lisp-mode-hook elisp-mode-hooks)

(use-package dockerfile-mode :ensure t)

(use-package markdown-mode+
  :ensure t
  :init
  (use-package markdown-preview-mode :ensure t))

(defun my-sql-mode-hook ()
  (setq-default) 
  (setq tab-width 3)
  (setq standard-indent 3) 
  (setq indent-tabs-mode nil))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

(use-package shader-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.fsh?\\'" . shader-mode))
  (add-to-list 'auto-mode-alist '("\\.vsh?\\'" . shader-mode)))

(use-package yaml-mode :ensure t)

(use-package elixir-mode :ensure t)
(use-package alchemist :ensure t)

(use-package gradle-mode :ensure t)

(load "~/.emacs.d/core/modes/kordano-org.el")
(load "~/.emacs.d/core/modes/kordano-web.el")
(load "~/.emacs.d/core/modes/kordano-clojure.el")
(load "~/.emacs.d/core/modes/kordano-swift.el")

(provide 'kordano-modes)
;;; kordano-modes.el ends here
