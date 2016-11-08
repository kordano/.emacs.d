;;; kordano-swift.el --- Yo Swift yo
;;; Commentary:
;;; Some stuff for a working swift mode
;;; CODE:


(use-package swift-mode :ensure t)

; (require 'swift-flycheck)

(defun my-swift-mode-hook ()
  (setq swift-indent-offset 2)
  (setq swift-indent-switch-case-offset 2))


(add-hook 'swift-mode-hook 'my-swift-mode-hook)
(add-hook 'swift-mode-hook 'electric-pair-mode)

;;; kordano-swift.el ends here
