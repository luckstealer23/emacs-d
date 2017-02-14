;;; global interface changes

;; always highlight syntax
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Highlight matching parentheses
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

;; show keystrokes
(setq echo-keystrokes 0.1)

;; Always show line number in the mode line
(line-number-mode 1)
;; ... and show the column number
(column-number-mode 1)

;; Show bell
(setq visible-bell nil)
(setq ring-bell-funciton (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))

(provide 'init-interface)
