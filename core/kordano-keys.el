;;; kordano-keys.el --- KEY BINDINGS
;;; Commentary:
;;; Key binding configuration
;;; CODE:

(use-package key-chord
  :ensure t
  :init (setq key-chord-two-keys-delay 0.2)
  :config
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

(global-set-key (kbd "<f5>") 'save-buffer)
(global-set-key (kbd "M-ö") (kbd "{"))
(global-set-key (kbd "C-ö") (kbd "["))
(global-set-key (kbd "C-ä") (kbd "]"))
(global-set-key (kbd "M-ä") (kbd "}"))

(global-set-key (kbd "A-<right>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "A-<left>") 'paredit-forward-barf-sexp)

;;; kordano-keys.el ends here
