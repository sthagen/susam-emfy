(copy-file "../init.el" ".emacs.d/init.el" t)
(find-file ".emacs.d/init.el")
(next-line 2)
(insert ";; Version: 0.1.0\n")
(insert ";; Package-Requires: ((emacs \"28.1\"))\n")
(insert ";; URL: https://example.com/\n")
(newline)
(save-buffer)
(flycheck-buffer)
(sleep-for 1)
(message "flycheck-current-errors: %s" flycheck-current-errors)
(dolist (error flycheck-current-errors)
  (princ
   (format "%s:%s:%s [%s] %s\n"
           (flycheck-error-filename error)
           (flycheck-error-line error)
           (flycheck-error-column error)
           (flycheck-error-level error)
           (flycheck-error-message error)) 'external-debugging-output))
(kill-emacs (if flycheck-current-errors 1 0))
