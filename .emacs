;;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
 
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
 
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working el-get.
;;(url-retrieve
;; "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;; (lambda (s)
;;   (end-of-buffer)
;;   (eval-print-last-sexp)))
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


(global-set-key "\C-x\C-b" 'bs-show)    ;; or another key
(global-set-key "\M-p"  'bs-cycle-previous)
(global-set-key "\M-n"  'bs-cycle-next)
  

(global-set-key (kbd "M-/") 'hippie-expand)


(defun kid-switch-to-shell ()
  (interactive)
  (when (null (cdr (window-list)))
    (split-window-vertically))
  (let ((file buffer-file-name))
    (other-window 1)
    (shell)
    (when file
      (end-of-buffer)
      (when (looking-back shell-prompt-pattern)
        (insert "cd " (file-name-directory file))
        (call-interactively 'comint-send-input)))))
(global-set-key (kbd "<C-f9>") 'kid-switch-to-shell)


(autoload 'shell-toggle "shell-toggle"
 "Toggles between the *shell* buffer and whatever buffer you are editing."
 t)
(autoload 'shell-toggle-cd "shell-toggle"
 "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
(global-set-key (kbd "<C-f9>") 'shell-toggle-cd)


(global-set-key "\C-x\C-b" 'bs-show)    ;; or another key
(global-set-key "\M-p"  'bs-cycle-previous)
(global-set-key "\M-n"  'bs-cycle-next)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (mkdown))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;  color-theme-solarized
(load-theme 'solarized t)

;; set default font
(set-default-font "Courier New-18")


(global-linum-mode 1)
(setq linum-format "%d")
