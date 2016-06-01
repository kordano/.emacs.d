;;; kordano-go.el --- GO CONFIGURATION
;;; Commentary:
;;; Configuration of go environment
;;; CODE:


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

(use-package go-mode
  :ensure t
  ;;:init (use-package go-autocomplete :ensure t)
  :config
  (setenv "GOPATH" "/users/konny/projects/go")
  (setq exec-path (cons "/usr/local/go/bin" exec-path))
  (add-to-list 'exec-path "/Users/konny/projects/go/")
  ;;(with-eval-after-load 'go-mode (require 'go-autocomplete))
  (add-hook 'before-save-hook 'my-go-mode-hook)
  ;;(add-hook 'go-mode-hook 'auto-complete-for-go))
  )

(provide 'kordano-go)
;;; kordano-go.el ends here
