;;; init.el --- Initialization
;;; Commentary:
;;; KONNY'S COOL CONFIG

;;; CODE:
;;; --- package management ---
;; time the loading of the .emacs
;; keep this on top of your .emacs
(defvar *emacs-load-start* (current-time))

(defun kordano/time-to-ms (time)
  (+ (* (+ (* (car time)
              (expt 2 16))
           (car (cdr time)))
        1000000)
     (car (cdr (cdr time)))))

(defun kordano/display-timing ()
  (message ".emacs loaded in %fms" (/ (- (kordano/time-to-ms (current-time)) (kordano/time-to-ms *emacs-load-start*)) 1000000.0)))
(add-hook 'after-init-hook 'kordano/display-timing t)

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "737d9d0e0f6c4279e80f7479ec5138af6e4908a2d052126f254e1e6d1a0d0188" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "0ae52e74c576120c6863403922ee00340a3bf3051615674c4b937f9c99b24535" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "232f715279fc131ed4facf6a517b84d23dca145fcc0e09c5e0f90eb534e1680f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "7e346cf2cb6a8324930c9f07ce050e9b7dfae5a315cd8ed3af6bcc94343f8402" "03e3e79fb2b344e41a7df897818b7969ca51a15a67dc0c30ebbdeb9ea2cd4492" default)))
 '(package-selected-packages
   (quote
    (web-mode swift-mode react-snippets powerline paredit moe-theme markdown-preview-mode markdown-mode+ magit key-chord js2-mode js-doc helm-projectile helm-company go-mode git-gutter+ flycheck flx-ido f dockerfile-mode company-tern company-sourcekit cider-eval-sexp-fu cider android-mode))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)

(if (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/Program Files/Git/bin"))

(when (not package-archive-contents)
  (package-refresh-contents))

(setq user-full-name "Konrad Kühne")

(load "~/.emacs.d/core/kordano-helpers.el")
(load "~/.emacs.d/core/kordano-style.el")
(load "~/.emacs.d/core/kordano-keys.el")
(load "~/.emacs.d/core/kordano-modes.el")


;;; init.el ends here
