;; Ben Moore's .emacs file
;; Remember to Document modifacations for future setup revisions

;; Contents
;; 1.Keyboard Modifacations
;; 2.Package Management
;; 3.Packages
;; 4.Display Defaults
;; 5.File Associations 



;;--------------------------------------------------------------------------

;; * 1.Keyboard Modifacations

;; Setting cmd to meta key
(setq mac-command-modifier 'meta)
(global-set-key (kbd "M-`") 'other-frame)


;; -------------------------------------------------------------------------


;; * 2.Package Mangement


;; Adding melpa package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; ------------------------------------------------------------------------


;; * 3.Packages


;; httpd/skewer setup
(require 'simple-httpd)
;; set root folder for httpd server
(setq httpd-root "/home/himynameisbeni/Desktop/webDev")
(add-hook 'html-mode-hook 'skewer-html-mode)
;; Impatient mode setup
(add-to-list 'load-path "~/.emacs.d/impatient-mode")
(require 'impatient-mode)


;; ------------------------------------------------------------------------


;; * 4.Display Defaults


;; Display line numbers by default
(global-linum-mode t)

;; Custom set variables
;; Hide toolbar and set fault theme etc
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Default theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Light theme
;;(load-theme 'sanityinc-solarized-light)

;; If you want to switch back to dark theme uncomment this line
(load-theme 'sanityinc-solarized-dark)

;; Hide scroll bar by default
(toggle-scroll-bar -1)

;; Emacs theme directories
(require 'dash)
(require 's)

(-each
   (-map
      (lambda (item)
      (format "~/.emacs.d/elpa/%s" item))
   (-filter
      (lambda (item) (s-contains? "theme" item))
      (directory-files "~/.emacs.d/elpa/")))
   (lambda (item)
      (add-to-list 'custom-theme-load-path item)))


;; ------------------------------------------------------------------------

;; * 5.File Associations

;;Web-mode File Associations

;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
