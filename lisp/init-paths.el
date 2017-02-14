;;; load path stuff

;; built-in modes
(defconst modes-lisp-dir
  (sz-join-dirs lisp-dir "modes")
  "Configuration for modes")

(sz-add-to-load-path modes-lisp-dir)

;; tmp directory for storing stupid crap
(make-directory (setq tmp-local-dir (sz-join-dirs dotfiles-dir ".tmp/")) t)

(defconst vendor-dotfiles-dir
  (sz-join-dirs dotfiles-dir "vendor")
  "External modules vendor-ised")

(sz-add-to-load-path vendor-dotfiles-dir)

(provide 'init-paths)
