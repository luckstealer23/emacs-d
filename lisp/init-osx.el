;; Mac hostnames have .local or similar appended
(setq system-name (car (split-string system-name "\\.")))
;; OS X ls doesn't support --dired
(setq dired-use-ls-dired nil)
(when (or *is-carbon-emacs*
	      *is-cocoa-emacs*)
  (defun load-material ()
    (load-theme 'material t))
  (add-hook 'after-init-hook 'load-material)
  ;; Mac GUI stuff
  ;; set my favourite Mac font as the default font
  (custom-set-faces
   '(default ((t (:height 140 :family "Inconsolata")))))

  ;; meta key configuration

  ;; This makes left-option do M-
  (setq ns-alernate-modifier nil)
  ;; ... and right-option just do option so I can still type
  ;; alternate characters.
  (setq ns-right-alternate-modifier 'meta)

  ;; command is super
  (setq ns-command-modifier 'super)

  ;; set fn to hyper
  (setq ns-function-modifier 'hyper)

  ;; we pretty much never ever want to background emacs
  (global-unset-key (kbd "C-z"))
  (global-unset-key (kbd "C-x C-z"))
  ;; Don't open files from the workspace in a new frame
  (setq ns-pop-up-frames nil)

  ;; Emacs launched from the desktop doesn't inherit the shell
  ;; env. This package:
  ;; https://github.com/purcell/exec-path-from-shell automatically
  ;; mirrors the PATH and other environment variables from a login
  ;; shell, ensuring that things work correctly.
  (use-package exec-path-from-shell
    :init
    (progn
      ;; copy SHELL correctly
      (setq exec-path-from-shell-variables '("PATH" "MANPATH" "SHELL"))
      ;; copy shell PATH across to exec-path
      (exec-path-from-shell-initialize)))
  (unless (display-graphic-p)

  (setq locate-command "mdfind")
  (setq delete-by-moving-to-trash t)
  (defun system-move-file-to-trash (file)
    "Use \"trash\" to move FILE to the system trash.
When using Homebrew, install it using \"brew install trash\"."
    (call-process (executable-find "trash") nil nil nil file)))
  ;; Configuration to make Emacs run semi-normally in an OS X
  ;; terminal

  ;; XXX: strongly recommended to run in iTerm2, as it's more
  ;; configurable than Terminal.app.

  ;; Make sure cut/paste works properly. Gotten from:
  ;; http://mindlev.wordpress.com/2011/06/13/emacs-in-a-terminal-on-osx/#comment-20
  (defun copy-from-osx ()
    "Copies the current clipboard content using the `pbcopy` command"
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    "Copies the top of the kill ring stack to the OSX clipboard"
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  ;; Override defaults to use the mac copy and paste
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

(provide 'init-osx)
