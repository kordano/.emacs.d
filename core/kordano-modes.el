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


;;; clojure
(use-package cider
  :ensure t
  :init (use-package cider-eval-sexp-fu :ensure t)
  :config
  (setq nrepl-log-messages t)
  (setq cider-show-error-buffer nil)
  (setq cider-repl-display-help-banner nil)
  (setq cider-prompt-save-file-on-load nil)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (add-hook 'cider-mode-hook #'eldoc-mode))

(defun clojure-mode-keys ()
  (local-set-key (kbd "C-c C-+") 'cider-jack-in)
  (local-set-key (kbd "C-c C-#") 'cider-jack-in-clojurescript)
  (local-set-key (kbd "C-c j") 'cider-eval-defun-at-point)
  (local-set-key (kbd "C-c k") 'cider-eval-last-sexp)
  (local-set-key (kbd "C-c ö") 'cider-eval-buffer)
  (local-set-key (kbd "C-c C-j") 'cider-eval-region)
  (local-set-key (kbd "C-c C-ü") 'cider-doc))

(defvar clojure-mode-hooks
  (list 'enable-paredit-mode
        'rainbow-delimiters-mode
        'rainbow-mode
        'clojure-mode-keys))

(use-package clojure-mode
  :ensure t
  :config
  (--map
   (lambda (file-rgx)
     (add-to-list 'auto-mode-alist '(file-rgx . clojure-mode)))
   (list "\\.edn\\'" "\\.dtm\\'" "\\.cljx\\'"))
  (add-all-hooks 'clojure-mode-hook clojure-mode-hooks)
  (define-clojure-indent
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)
    (render 'defun)
    (query 'defun)
    (params 'defun)))

;;; kordano-modes.el ends here
