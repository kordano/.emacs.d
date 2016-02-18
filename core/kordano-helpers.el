;;; kordano-helpers.el --- LITTLE HELPERS
;;; Commentary:
;;; little helpers that make day-to-day stuff easier
;;; CODE:

(setq redisplay-dont-pause t)

;; backup
(setq make-backup-files nil)

;; easier package management
(add-to-list 'load-path "~/.emacs.d/libs/use-package")
(require 'use-package)

;; emacs lisp functional helpers
(use-package dash
  :ensure t
  :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package dash-functional :ensure t)
(use-package f :ensure t)

;; git
(use-package magit
  :ensure t
  :config
  (use-package evil-magit :ensure t)
  :bind ("C-c C-ä" . magit-status))

;; completion
(use-package helm :ensure t)

;; autocompletion
(use-package company
  :ensure t
  :config
  (setq company-echo-delay 0)
  (add-hook 'after-init-hook 'global-company-mode)
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-,") 'helm-company)
       (define-key company-active-map (kbd "C-.") 'helm-company))))


;; snipptes
(use-package yasnippet 
  :ensure t 
  :config
  (yas-global-mode 1))

;; git infos
(use-package git-gutter+ :ensure t :config (global-git-gutter+-mode))
;;; kordano-helpers.el ends here
