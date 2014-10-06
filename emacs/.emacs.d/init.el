(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(setq multi-term-program-switches "--login")

(require 'linum)
(global-linum-mode 1)

(require 'linum-off)

(require 'ido)
(ido-mode t)

(require 'smooth-scrolling)

(speedbar 1)

(require 'go-mode-load)

;; Package setup for jedi
 (add-to-list 'load-path "~/.emacs.d") ; to find Emacs 23 package.el
 (require 'package)
 (package-initialize)
 (add-to-list 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)
 (defvar local-packages '(projectile auto-complete epc jedi))
 (defun uninstalled-packages (packages)
 (delq nil
 (mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))
;; ;; This delightful bit adapted from:
;; ;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
 (let ((need-to-install (uninstalled-packages local-packages)))
 (when need-to-install
 (progn
 (package-refresh-contents)
 (dolist (p need-to-install)
 (package-install p)))))

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(setq jedi-config:use-system-python t)

;; Set Copy and Paste to middle click on mouse after highliting (just like it should be)
;;http://www.emacswiki.org/emacs-en/CopyAndPaste
;(transient-mark-mode 1)  ; Now on by default: makes the region act quite like the text "highlight" in many apps.
; (setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection
;; these will probably be already set to these values, leave them that way if so!
; (setf interprogram-cut-function 'x-select-text)
; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)
; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
; text with the mouse if you want to)
(setq select-active-regions t) ;  active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.
;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.

;;auto reload
(global-auto-revert-mode t)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Smooth scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) .1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; Cursor bar
(setq-default cursor-type 'bar)

;;Quiet startup
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; No toolbar
(tool-bar-mode -1)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai/")
;(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)

;; Fonts
;(custom-set-faces'(default ((t (:inherit nil :height 100 :family "DejaVu Sans Mono")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t ("-*-Inconsolata-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")))))


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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(cursor-color "#657b83")
 '(custom-safe-themes (quote ("479eba125f9e97a0208b642a99eee1d816fa208fe3a06f73e444504beb0b17f7" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#657b83"))
