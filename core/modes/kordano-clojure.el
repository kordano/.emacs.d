;;; kordano-clojure.el --- CLOJURE CONFIGURATION
;;; Commentary:
;;; Configuration of clojure environment
;;; CODE:

(use-package cider
  :ensure t
  :init
  (use-package cider-eval-sexp-fu :ensure t)
  :config
  (setq nrepl-l
        og-messages t)
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

(defun my-add-pretty-lambda ()
  (setq prettify-symbols-alist
        '(
          ("fn" . 955)
          ("lambda" . 955)
          ("->" . 8594)
          ("=>" . 8658)
          ("map" . 8614))))

(defun my-clj-indentation ()
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

(defun my-clj-files ()
  (--map
   (lambda (file-rgx)
     (add-to-list 'auto-mode-alist '(file-rgx . clojure-mode)))
   (list "\\.edn\\'" "\\.dtm\\'" "\\.cljx\\'")))

(defvar clojure-mode-hooks
  (list 'enable-paredit-mode
        'highlight-symbol-mode
        'clojure-mode-keys
        'clj-refactor-mode
        'yas-minor-mode
        'hs-minor-mode
        'my-add-pretty-lambda
        'my-clj-indentation
        'my-clj-files))

(use-package clojure-mode
  :ensure t
  :init (use-package clj-refactor :ensure t)
  :config
  (add-all-hooks 'clojure-mode-hook clojure-mode-hooks)
  (cljr-add-keybindings-with-prefix "C-c C-ö"))

(provide 'kordano-clojure)
;;; kordano-clojure.el ends here
