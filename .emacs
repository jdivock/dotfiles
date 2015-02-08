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

;;; Can't get this working - Paredit for JS files
;(add-hook 'js2-mode-hook 'esk-paredit-nonlisp) ;for emacs starter kit

;;; Set better js mode for js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; skewer js to pipe commands to browser
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;;(require 'powerline)
;;(powerline-default-theme)
;;(require 'powerline-evil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; until I figure out a better way to share installed packages
;;;(ac-js2 skewer-mode js2-mode simple-httpd js2-mode auto-complete popup color-theme-sanityinc-tomorrow popup powerline-evil powerline evil goto-chg undo-tree skewer-mode js2-mode simple-httpd starter-kit magit git-rebase-mode git-commit-mode ido-ubiquitous smex find-file-in-project idle-highlight-mode paredit undo-tree yasnippet)

