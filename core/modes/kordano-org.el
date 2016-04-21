;;; kordano-org.el --- OrgMode Configuration
;;; Commentary:
;;; Aimed to fit OrgMode into daily development process
;;; CODE:
(add-to-list 'load-path "~/.emacs.d/libs/org-mode")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files '("~/org"))

(add-hook 'org-mode-hook (lambda () (toggle-truncate-lines)))

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-include-all-todo t)
(setq org-use-fast-todo-selection t)
(setq org-log-done 'time)
(setq org-agenda-include-diary t)
(setq org-deadline-warning-days 1)
(setq org-agenda-window-setup 'current-window)
(setq org-log-into-drawer t)
(setq org-clock-into-drawer t)
(setq org-agenda-use-time-grid nil)
(setq org-tag-alist '(("design" . ?d)
                      ("meeting" . ?e)
                      ("research" . ?s)
		      ("feature" ?f)
                      ("management" . ?g)
		      ("test" . ?t)
		      ("doc" . ?c)
		      ("review" . ?r)
		      ("deployment" . ?y)
                      ("bug" . ?b)
                      ("improvement" . ?i)
		      ("mail" . ?m)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(s!)" "WAITING(w!)" "|" "DONE(d!)")
	(sequence "|" "CANCELED(c@)" "DELEGATED(g@/!)")))

;; (setq org-todo-keyword-faces '(("TODO"  . (:foreground "#9AEE3A" :weight bold)) ("IN PROGRESS"  . (:foreground "orange" :weight bold)) ("DONE"  . (:foreground "forestgreen" :weight bold)) ("CANCELED"  . shadow)))

(setq org-capture-templates
  '(("t" "Task" entry (file+datetree (select-project)) "* TODO %^{Description} %^g\n  DEADLINE: %^{Deadline}t\n  :PROPERTIES:\n  :Created: %U\n  :Effort: %^{Effort}\n  :END:\n  %?")))


(setq org-clock-persist 'history)

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "s-<return>") 'org-insert-heading)
(global-set-key (kbd "C-c C-ü") 'org-agenda-list)
(global-set-key (kbd "C-c ü") 'org-todo-list)
(global-set-key (kbd "C-c C-ß") 'org-agenda-filter-by-category)
(add-hook 'calendar-load-hook
	  (lambda ()
	    (calendar-set-date-style 'european)))


(setq calendar-week-start-day 1
      calendar-day-name-array ["Sonntag" "Montag" "Dienstag" "Mittwoch"
			       "Donnerstag" "Freitag" "Samstag"]


      calendar-month-name-array ["Januar" "Februar" "März" "April" "Mai"
				 "Juni" "Juli" "August" "September"
				 "Oktober" "November" "Dezember"])

(setq solar-n-hemi-seasons
      '("Frühlingsanfang" "Sommeranfang" "Herbstanfang" "Winteranfang"))

(setq holiday-general-holidays
      '((holiday-fixed 1 1 "Neujahr")
        (holiday-fixed 5 1 "1. Mai")
        (holiday-fixed 10 3 "Tag der Deutschen Einheit")))

;; Feiertage für Bayern, weitere auskommentiert
(setq holiday-christian-holidays
      '((holiday-float 12 0 -4 "1. Advent" 24)
        (holiday-float 12 0 -3 "2. Advent" 24)
        (holiday-float 12 0 -2 "3. Advent" 24)
        (holiday-float 12 0 -1 "4. Advent" 24)
        (holiday-fixed 12 25 "1. Weihnachtstag")
        (holiday-fixed 12 26 "2. Weihnachtstag")
        (holiday-fixed 1 6 "Heilige Drei Könige")
        (holiday-easter-etc -48 "Rosenmontag")
        ;; (holiday-easter-etc -3 "Gründonnerstag")
        (holiday-easter-etc  -2 "Karfreitag")
        (holiday-easter-etc   0 "Ostersonntag")
        (holiday-easter-etc  +1 "Ostermontag")
        (holiday-easter-etc +39 "Christi Himmelfahrt")
        (holiday-easter-etc +49 "Pfingstsonntag")
        (holiday-easter-etc +50 "Pfingstmontag")
        (holiday-easter-etc +60 "Fronleichnam")
        (holiday-fixed 8 15 "Mariae Himmelfahrt")
        (holiday-fixed 11 1 "Allerheiligen")
        ;; (holiday-float 11 3 1 "Buss- und Bettag" 16)
        (holiday-float 11 0 1 "Totensonntag" 20)))

(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(provide 'kordano-org)
;;; kordano-org.el ends here
