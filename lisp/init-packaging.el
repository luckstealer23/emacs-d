;; Packaging and vendor configuration

;; Packages I always want
(defvar sz-elpa-package-list
  '(ag
    avy
    bind-key ;; this is required by use-package, but isn't auto-installed
    browse-kill-ring
    counsel
    counsel-osx-app
    diminish
    evil
    evil-leader
    evil-nerd-commenter
    evil-escape
    expand-region
    general
    ivy
    magit
    magit-find-file
    markdown-mode
    material-theme
    multiple-cursors
    swiper
    undo-tree
    use-package
    web-mode
    which-key)
  "Packages from ELPA that I always want to install.")

;; Mac specific packages
(when *is-a-mac*
  (add-to-list 'sz-elpa-package-list 'counsel-osx-app)
  (add-to-list 'sz-elpa-package-list 'exec-path-from-shell))

;; Blacklist some non-melpa packages
(eval-after-load 'melpa
  '(setq package-archive-exclude-alist
         '(("melpa"
            diminish            ;; not updated in ages
            evil                ;; want stable version
            evil-leader         ;; want stable verison
            evil-nerd-commenter ;; want stable version
            melpa               ;; don't want to self-host this
            ))))

;;; ELPA directory structure and loading
(eval-after-load 'package
  '(progn
     (defconst sz-package-base-dir
       (sz-join-dirs lisp-dir "packages")
       "Base path for all packaging stuff")

     (sz-add-to-load-path sz-package-base-dir)

     (defvar sz-package-elpa-base-dir
       (sz-join-dirs sz-package-base-dir "elpa")
       "Where Emacs packaging.el packages are installed.")

     (make-directory sz-package-elpa-base-dir t)

     ;; tell packaging to install files here
     (setq package-user-dir sz-package-elpa-base-dir)

     ;; Only use 3 specific directories
     (setq package-archives
           '(("gnu"       . "http://elpa.gnu.org/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")
             ("melpa"     . "http://melpa.milkbox.net/packages/")))

     ;; initialise package.el
     (package-initialize)

     ;; Clean up after ELPA installs:
     ;; https://github.com/purcell/emacs.d/blob/master/init-elpa.el

     ;; Auto-install the Melpa package, since it's used to filter
     ;; packages.
     (defun essential-packages-installed-p (to-install)
       "Checks whether all my essential packages are installed."
       (loop for p in to-install
             when (not (package-installed-p p)) do (return nil)
             finally (return t)))
     (defun install-essential-packages (to-install)
       "Auto-installs all my packages"
       (unless (essential-packages-installed-p to-install)
         (message "%s" "Installing essential packages...")
         (package-refresh-contents)
         (dolist (p to-install)
           (unless (package-installed-p p)
             (package-install p)))
         (delete-other-windows)))

     (install-essential-packages sz-elpa-package-list)))


(require 'package nil t)
(provide 'init-packaging)
