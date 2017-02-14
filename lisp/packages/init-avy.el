(use-package avy :ensure t
  :commands (avy-goto-word-or-subword-1
             avy-goto-word-1
             avy-goto-char-in-line
             avy-goto-line)
  :config
  (setq avy-keys '(?a ?u ?i ?e ?t ?s ?r ?n ?m))
  (setq avy-styles-alist
        '((avy-goto-char-in-line . post)
          (avy-goto-word-or-subword-1 . post))))

(provide 'init-avy)
