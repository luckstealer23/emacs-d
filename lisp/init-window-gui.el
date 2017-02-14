;; show help in the echo area instead as a tooltip
(tooltip-mode -1)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Inconsolata 14")
(global-visual-line-mode)
(diminish 'visual-line-mode "" )

(set-frame-size (selected-frame) 85 61)

;; blink the cursor
(setq blink-cursor-interval 1.0)
(blink-cursor-mode)

;; indicate EOF empty lines in the gutter
(setq indicate-empty-lines t)

;; never pop a dialogue
(setq use-dialog-box nil)

;; From:
;; http://emacs-fu.blogspot.co.uk/2011/01/setting-frame-title.html
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(use-package display-time
  :commands
  display-time-mode
  :config
  (setq display-time-24hr-format t
        display-time-day-and-date t
        display-time-format))
(provide 'init-window-gui)
