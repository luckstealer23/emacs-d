(use-package evil
  :init
  (progn
    ;; if we don't have this evil overwrites the cursor color
    (setq evil-default-cursor t)

    ;; leader shortcuts

    ;; This has to be before we invoke evil-mode due to:
    ;; https://github.com/cofi/evil-leader/issues/10
    (use-package evil-leader :ensure t
      :init (global-evil-leader-mode)
      )
    (use-package evil-escape :ensure t
      :init (evil-escape-mode))

    ;; boot evil by default
    (evil-mode 1)
    (evil-escape-mode 1))
  :config
  (progn
    ;; jj escapes to normal mode
    (setq-default evil-escape-key-sequence "jk")
    (setq-default evil-escape-delay 0.2)
    (setq
     ;; h/l wrap around to next lines
     evil-cross-lines t
     ;; Training wheels: start evil-mode in emacs mode
     )

    ;; esc should always quit: http://stackoverflow.com/a/10166400/61435
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
    (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)))

(provide 'init-evil)
