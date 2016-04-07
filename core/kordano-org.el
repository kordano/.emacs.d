;;; kordano-org.el --- OrgMode Configuration
;;; Commentary:
;;; Aimed to fit OrgMode into daily development process
;;; CODE:
(add-to-list 'load-path "~/.emacs.d/libs/org-mode")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(provide 'kordano-org)
;;; kordano-org.el ends here
