(autoload 'coffee-mode "coffee-mode" "\
Major mode for editing CoffeeScript.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))

(add-hook 'coffee-mode-hook
          #'(lambda ()
              (set (make-local-variable 'tab-width) 2)
              (setq coffee-tab-width 2)
              (setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
              (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace
              (define-key coffee-mode-map (kbd "C-c o") #'coffee-compile-buffer)

              (define-key coffee-mode-map (kbd "C-c C-k") #'coffee-compile-buffer)
              (define-key coffee-mode-map (kbd "C-c C-l") #'coffee-build-for-grunt)
              ))

(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map (kbd "C-c o") #'ff-find-other-file)
              ))


;; (add-hook 'after-save-hook
;;           #'(lambda ()
;;               (when (eq major-mode 'coffee-mode)
;;                 (coffee-compile-file))))

(defun coffee-build-for-grunt ()
  "coffee-script compile for grunt task"
  (interactive)
  (let ((cur-dir (expand-file-name default-directory)))
    (compile 
     (cond ((string-match "client" cur-dir) "grunt coffee:client")
           ((string-match "server" cur-dir) "grunt coffee:server")
           (t "grunt coffee"))
     )))
