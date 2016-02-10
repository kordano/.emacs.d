;;; init.el --- Initialization
;;; Commentary:
;;; KONNY'S COOL CONFIG

;;; CODE:
;;; --- package management ---


(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "7e346cf2cb6a8324930c9f07ce050e9b7dfae5a315cd8ed3af6bcc94343f8402" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" default))))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq user-full-name "konny")

(load "~/.emacs.d/core/kordano-helpers.el")
(load "~/.emacs.d/core/kordano-style.el")
(load "~/.emacs.d/core/kordano-keys.el")
(load "~/.emacs.d/core/kordano-modes.el")

;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
