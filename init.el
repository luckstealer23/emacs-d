;;; Package.el
(defconst dotfiles-dir
  (file-name-directory
   (or (buffer-file-name) load-file-name))
  "Base path for customised Emacs configuration")

(defconst lisp-dir
  (concat user-emacs-directory (file-name-as-directory "lisp"))
  "Base path for lisp codes")

(add-to-list 'load-path lisp-dir)
(defconst *is-a-mac*
  (eq system-type 'darwin)
  "is this running on OS x?")
(defconst *is-carbon-emacs*
  (and *is-a-mac* (eq window-system 'mac))
  "Is this the Carbon port of Emacs?")

(defconst *is-cocoa-emacs*
  (and *is-a-mac* (eq window-system 'ns))
  "Is this the Cocoa version of Emacs?")

(defconst *is-linux*
  (eq system-type 'gnu/linux)
  "Is this running on Linux?")

(require 'init-utils)
(require 'init-paths)
(require 'init-editing)
(require 'init-interface)
(require 'init-packaging)
(require 'init-use-package)
(require 'init-backups)
(use-package init-window-gui
  :if (display-graphic-p))

(use-package init-osx
  :if *is-a-mac*)

;; Mode configuration
;; built-in modes

;; Packaged modes from ELPA etc.
(require 'init-keybindings)
(defconst elpa-modes
  '(init-ag
    init-avy
    init-counsel
    init-evil
    init-magit
    init-swiper
    init-which-key)
  "Configuration for modes loaded via package.el")
(sz-require-list elpa-modes)

(when after-init-time
  (run-hooks 'after-init-hook))
