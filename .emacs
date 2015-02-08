(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	                  '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	                  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
      (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'evil)
(evil-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(require 'wc-mode)
;; DayOne plugin
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "dayone")

;;; Can't get this working - Paredit for JS files
;(add-hook 'js2-mode-hook 'esk-paredit-nonlisp) ;for emacs starter kit

;;; Set better js mode for js files
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

;; skewer js to pipe commands to browser
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;(require 'powerline)
;(powerline-center-evil-theme)

;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))

;; fix fullscreen to not be mac naitive
(setq ns-use-native-fullscreen nil)
;; (toggle-frame-fullscreen) ;; and start in full screen while we're at it

;; term stuff
(require 'multi-term)
(setq multi-term-program "/bin/zsh")


;(require 'editorconfig)
;(load "editorconfig")

;; remap cmd to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(define-key global-map (kbd "M-[") 'previous-multiframe-window)
(define-key global-map (kbd "M-]") 'other-window)

;; fonts
(set-face-attribute 'default nil
                    :family "Source Code Pro Medium" :height 135 :weight 'normal)

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#424242")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; until I figure out a better way to share installed packages
;;;(ac-js2 skewer-mode js2-mode simple-httpd js2-mode auto-complete popup color-theme-sanityinc-tomorrow popup powerline-evil powerline evil goto-chg undo-tree skewer-mode js2-mode simple-httpd starter-kit magit git-rebase-mode git-commit-mode ido-ubiquitous smex find-file-in-project idle-highlight-mode paredit undo-tree yasnippet)

