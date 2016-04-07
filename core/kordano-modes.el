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
        'highlight-symbol-mode
        'enable-paredit-mode))

(add-all-hooks 'emacs-lisp-mode-hook elisp-mode-hooks)

;; javascript helpers
(add-to-list 'load-path "~/.emacs.d/libs/nodejs-repl.el")
(require 'nodejs-repl)

(use-package js-doc
  :ensure t
  :config
  (setq js-doc-mail-address "konrad.kuehne@livelycode.com"
       js-doc-author (format "Konrad Kuehne <%s>" js-doc-mail-address)
       js-doc-url "https://www.livelycode.com"
       js-doc-license "ISC"))

;; javacsript
(defun js2-mode-keys ()
  (local-set-key (kbd "C-c C-+") 'nodejs-repl)
  (local-set-key (kbd "C-c C-j") 'nodejs-repl-send-last-sexp)
  (local-set-key (kbd "C-c C-ö") 'nodejs-repl-send-buffer)
  (local-set-key (kbd "C-c C-k") 'nodejs-repl-send-region)
  (local-set-key (kbd "C-c C-l") 'nodejs-repl-switch-to-repl)
  (local-set-key (kbd "C-c i") 'js-doc-insert-file-doc)
  (local-set-key (kbd "@") 'js-doc-insert-tag))

(defun js-disable-ident-tabs ()
  (set-variable 'ident-tabs-mode nil))

(use-package js2-mode :ensure t)

                                        ;TODO: Fix tern mode
(use-package tern :ensure t)
(add-to-list 'load-path "/Users/konny/Library/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("(not  )ode" . js2-mode))
(setq js2-strict-missing-semi-warning nil)
(setq-default js2-basic-offset 2)
(font-lock-add-keywords 'js2-mode '(("fetch" . font-lock-keyword-face)))

(defvar js2-mode-hooks
  (list 'js-disable-ident-tabs
        'electric-pair-mode
        'js2-mode-keys
        'highlight-symbol-mode
        'hs-minor-mode))

(add-all-hooks 'js2-mode-hook js2-mode-hooks)

;(use-package company-tern :ensure t :config (add-to-list 'company-backends 'company-tern))

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
        'highlight-symbol-mode
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

;;; web
(defun auto-web-mode-files ()
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (local-set-key (kbd "\C-cj") 'company-yasnippet)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (set-face-attribute 'web-mode-current-element-highlight-face nil :background "#f92672" :foreground "black")
  (setq web-mode-enable-current-element-highlight t)
  (font-lock-add-keywords 'web-mode '(("fetch" . font-lock-keyword-face)))
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (web-mode-set-content-type "jsx")
  (setq web-mode-code-indent-offset 2))

(use-package web-mode
  :ensure t
  :init (use-package react-snippets :ensure t)
  :config
  (add-all-hooks 'web-mode-hook (list 'my-web-mode-hook 'highlight-symbol-mode 'web-mode-keys)))


(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;; docker
(use-package dockerfile-mode :ensure t)

;;; markdown

(use-package markdown-mode+
  :ensure t
  :init
  (use-package markdown-preview-mode :ensure t))

;;; go language
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq-default) 
  (setq tab-width 2)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v & go test -v & go vet"))
  (setq standard-indent 2) 
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "M-.") 'godef-jump))

;;(defun auto-complete-for-go () (auto-complete-mode 1))

(use-package go-mode
  :ensure t
  ;;:init (use-package go-autocomplete :ensure t)
  :config
  (setenv "GOPATH" "~/projects/go")
  (setq exec-path (cons "/usr/local/go/bin" exec-path))
  (add-to-list 'exec-path "~/projects/go/")
  ;;(with-eval-after-load 'go-mode (require 'go-autocomplete))
  (add-hook 'before-save-hook 'my-go-mode-hook)
  ;;(add-hook 'go-mode-hook 'auto-complete-for-go)
  )

;; sql
(defun my-sql-mode-hook ()
  (setq-default) 
  (setq tab-width 3)
  (setq standard-indent 3) 
  (setq indent-tabs-mode nil))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

;; swift
(load "~/.emacs.d/core/kordano-swift.el")

;; org
(load "~/.emacs.d/core/kordano-org.el")




(provide 'kordano-modes)
;;; kordano-modes.el ends here
