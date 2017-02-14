(require 'cl)
(require 'grep)

(defun sz-turn-on-auto-fill ()
  "Enables auto-fill"
  (interactive)
  (auto-fill-mode 1))

(defun sz-turn-off-auto-fill ()
  "Disables auto-fill"
  (interactive)
  (auto-fill-mode -1))

(defun sz-enable-hl-line-mode ()
  "Enables hl-line-mode"
  (interactive)
  (hl-line-mode 1))

(defun sz-turn-on-electric-indent-mode ()
  "Turns on electric-indent-mode"
  (interactive)
  (electric-indent-mode 1))

(defun sz-turn-off-electric-indent-mode ()
  "Turns off electric-indent-mode"
  (interactive)
  (electric-indent-mode -1))

(defun sz-locate-library-dir (library)
  "Locates the directory containing a loaded library"
  (file-name-directory (locate-library library)))

(defun sz-add-to-load-path (dir)
  "Adds `dir` to load-path"
  (add-to-list 'load-path dir))

(defun sz-add-to-custom-theme-load-path (dir)
  "Adds `dir` to custom-theme-load-path"
  (add-to-list 'custom-theme-load-path dir))

(defun sz-evil-escape-if-next-char (c)
  "Watches the next letter.  If c, then switch to Evil's normal mode; otherwise insert a k and forward unpressed key to unread-command events"
  (self-insert-command 1)
  (let ((next-key (read-event)))
    (if (= c next-key)
        (progn
          (delete-backward-char 1)
          (do-evil-esc))
      (setq unread-command-events (list next-key)))))

(defun sz-evil-escape-if-next-char-is-k (arg)
  "Wrapper around escape-if-next-char and the character k"
  (interactive "p")
  (if (= arg 1)
      (sz-evil-escape-if-next-char ?k)
    (self-insert-command arg)))

(defun sudo-edit (&optional arg)
  "Edit this file as sudo"
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo::"))))

(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'" str)
    (setq str (replace-match "" t t str))) str)

(defun sz-require-list (items)
  "Takes a list of items to require"
  (interactive)
  (dolist (item items)
    (require `,item nil t)))

(defun sz-join-dirs (prefix suffix)
  "Joins `prefix` and `suffix` into a directory"
  (file-name-as-directory (concat prefix suffix)))

(defun sz-kill-emacs ()
  "If this buffer is a client, just kill it, otherwise confirm
the quit."
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (cond ((y-or-n-p "Quit Emacs? ")
           (save-buffers-kill-terminal)))))

(provide 'init-utils)
