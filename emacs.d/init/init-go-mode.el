(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "M-t") 'godef-jump)
            ;; (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
