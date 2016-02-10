;;; kordano-helpers.el --- LITTLE HELPERS
;;; Commentary:
;;; little helpers that make day-to-day stuff easier
;;; CODE:

(setq redisplay-dont-pause t)

;; backup
(setq make-backup-files nil)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory)))

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

;;; kordano-helpers.el ends here
