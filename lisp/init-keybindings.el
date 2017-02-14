(use-package general :ensure t
  :config
  ;;; C-
  (general-define-key
   "C-l" (lambda () (interactive) (avy-goto-line 4))
   "C-'" 'avy-goto-word-or-subword-1)
  ;;; C-c
  (general-define-key
   "C-c v" 'magit-status))
;;; C-x
  (general-define-key
   "C-x d" 'dired-other-window
   "C-x o" 'other-window
   "C-x =" 'balance-windows

   "C-x C-r" 'ivy-switch-buffer
   )
;;; Which-key

;; key description for C-x
(provide 'init-keybindings)
