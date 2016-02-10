;;; kordano-keys.el --- KEY BINDINGS
;;; Commentary:
;;; Key binding configuration
;;; CODE:

(use-package key-chord
  :ensure t
  :init (setq key-chord-two-keys-delay 0.2)
  :config
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-mode 1))


;;; kordano-keys.el ends here
