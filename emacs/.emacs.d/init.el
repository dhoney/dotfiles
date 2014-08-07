(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-program-switches "--login")

(require 'linum)
(global-linum-mode 1)

(require 'ido)
(ido-mode t)

(require 'smooth-scrolling)

;;auto reload
(global-auto-revert-mode t)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Smooth scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) .1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; Cursor bar
(setq-default cursor-type 'bar

;;Quiet startup
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai/")
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)

;; Fonts
;(custom-set-faces'(default ((t (:inherit nil :height 100 :family "DejaVu Sans Mono")))))
(custom-set-faces'(default ((t ( "-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")))))


;; Custom toggle between light/dark theme with F11 binding
(defcustom default-light-color-theme 'solarized-light
  "default light theme")

(defcustom default-dark-color-theme 'monokai
  "default dark theme")

(defun toggle-dark-light-theme ()
  (interactive)

  (let ((is-light (find default-light-color-theme custom-enabled-themes)))
    (dolist (theme custom-enabled-themes)
      (disable-theme theme))
    (load-theme (if is-light default-dark-color-theme default-light-color-theme))))

(if window-system
    (progn
      (global-set-key (kbd "<f11>") 'toggle-dark-light-theme)
      (load-theme 'solarized-light)
      (set-face-font 'default (if (eq window-system 'w32)
                                  "Consolas-10" "Liberation Mono-10"))))

