(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-program-switches "--login")

(require 'linum)
(global-linum-mode 1)


(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)

;; Fonts
;(custom-set-faces'(default ((t (:inherit nil :height 100 :family "DejaVu Sans Mono")))))
(custom-set-faces'(default ((t ( "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")))))
