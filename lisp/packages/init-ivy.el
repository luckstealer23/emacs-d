(use-package ivy
  :quelpa (ivy :fetcher github :repo "abo-abo/swiper")
  :diminish (ivy-mode . "")
  :commands (ivy-switch-buffer
             ivy-switch-buffer-other-window)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-initial-inputs-alist nil)
  ;; from https://github.com/company-mode/company-statistics
  ;; ignore buffers in the ignore buffer list.
  (setq ivy-use-ignore-default 'always)
  (setq ivy-ignore-buffers '("company-statistics-cache.el" "company-statistics-autoload.el"))
  ;; if ivy-flip is t, presents results on top of query.
  (setq ivy-flip nil)
  (setq ivy-overlay-at nil)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-ignore-order)
          (manual-entry . ivy--regex-ignore-order)
          (t      . ivy--regex)
          (t      . ivy--regex-ignore-order)))

  (defun ivy-switch-project ()
    (interactive)
    (ivy-read
     "Switch to project: "
     (if (projectile-project-p)
         (cons (abbreviate-file-name (projectile-project-root))
               (projectile-relevant-known-projects))
       projectile-known-projects)
     :action #'projectile-switch-project-by-name))

  (global-set-key (kbd "C-c m") 'ivy-switch-project)

  (ivy-set-actions
   'ivy-switch-project
   '(("d" dired "Open Dired in project's directory")
     ("v" counsel-projectile "Open project root in vc-dir or magit")
     ("c" projectile-compile-project "Compile project")
     ("r" projectile-remove-known-project "Remove project(s)"))))
