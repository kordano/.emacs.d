;;; kordano-eb.el --- WEB CONFIGURATION
;;; Commentary:
;;; Configuration of web development modes
;;; CODE:

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
  (setq web-mode-enable-auto-closing t)
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


(provide 'kordano-web)
;;; kordano-web.el ends here

