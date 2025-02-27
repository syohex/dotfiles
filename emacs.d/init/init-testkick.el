(add-to-load-path "~/.emacs.d/elisp/testkick/")
(require 'testkick)
(global-set-key (kbd "C-M-@") 'testkick)
(global-set-key (kbd "C-M-;") 'testkick-toggle)
  

;; Coloring on the results of shell command. Handle escape sequences correctly
(autoload 'ansi-color-apply-on-region "ansi-color"
  "Set `ansi-color-apply-on-region' to t." t)
(add-hook 'compilation-filter-hook
          '(lambda ()
             (ansi-color-apply-on-region (point-min) (point-max))))
