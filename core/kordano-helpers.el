;;; kordano-helpers.el --- LITTLE HELPERS
;;; Commentary:
;;; little helpers that make day-to-day stuff easier
;;; CODE:


(setq redisplay-dont-pause t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; backup
(setq make-backup-files nil)

;; 
(add-to-list 'load-path "~/.emacs.d/libs/org-mode/lisp")

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
(use-package helm
  :ensure t
  :config (helm-autoresize-mode t)
  :bind ("C-c f" . helm-recentf))

(use-package helm-company :ensure t)

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
(use-package git-gutter+
  :ensure t
  :config (global-git-gutter+-mode))


;; flycheck
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; tern support

;; ido stuff
(use-package flx-ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil)
  (setq gc-cons-threshold 20000000))

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien))


(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil)


;; TODO: add some hydra bindings
(use-package hydra :ensure t)


(use-package highlight-symbol
  :ensure t
  :bind
  ("C-c ." . highlight-symbol-at-point)
  ("C-c -" . highlight-symbol-next)
  ("C-c ," . highlight-symbol-prev))

;;; kordano-helpers.el ends here
