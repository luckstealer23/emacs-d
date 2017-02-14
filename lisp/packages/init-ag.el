(use-package ag :ensure t
  :commands (ag)
  :config
  (progn
    (setq ag-highlight-search t)
    (setq ag-reuse-buffers t)))
(provide 'init-ag)
