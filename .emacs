;; removing annoying emacs splash screen
(setq inhibit-splash-screen t)

;;
;; Now color and funky stuffz;
;;
(set-cursor-color "red")
;;; allow reading of archives without unpacking them explicitly.
(load-library "jka-compr")
(load-library "time-stamp")

;;; some editing preferences...
(setq scroll-step 1)

;;; Consider upper case durint search
(setq-default case-fold-search nil)

; (setq line-number-mode 1)
(setq-default search-highlight t)

;; Expresions with par.
(show-paren-mode)
(setq show-paren-style 'expression)

;;; some keybindings...
(global-set-key "
" 'newline-and-indent)
(global-set-key "" 'goto-line)
(global-set-key '[C-right] 'forward-word)
(global-set-key '[C-left] 'backward-word)
(global-set-key '[f12] 'shell)
(global-set-key '[C-f9] 'kill-compilation)
;(global-set-key "n" 'forward-sentence)
;(global-set-key "p" 'backward-sentence)

;;; these ones allow smoother scroll-other-window functions
(defun scroll-other-window-down-one-line ()
  "Scroll the other window down one line."
  (interactive)
  (scroll-other-window 1))
(defun scroll-other-window-one-line ()
  "Scroll the other window up one line."
  (interactive)
  (scroll-other-window -1))
(global-set-key '[M-up] 'scroll-other-window-down-one-line)
(global-set-key '[M-down] 'scroll-other-window-one-line)
(global-set-key '[M-C-end] 'goto-line)

;;; programming hot keys
(global-set-key '[f9] 'compile)
(global-set-key '[f18] 'previous-error)
(global-set-key '[f8] 'next-error)
(global-set-key '[f11] 'c-make-separator)


;;; font-lock stuff
(setq font-lock-face-attributes '((font-lock-comment-face "red2")
                                  (font-lock-string-face "DarkGreen")
                                  (font-lock-keyword-face "black")
                                  (font-lock-function-name-face "gray15"
                                                                nil t)
                                  (font-lock-variable-name-face "blue")
                                  (font-lock-type-face "gray8")))
;; SDM                                  (font-lock-reference-face "blue")))

(global-font-lock-mode t)
(setq-default font-lock-maximum-decoration t)

;;; some hand sequences for C coding
(fset 'c-make-big-comment
   [?/ ?* ?  -134217672 -134217680 ?- return backspace backspace ?* return ?* ?  -134217672 -134217680 ?- ?  ?* ?/ up ?  ? ])
(global-set-key '[M-f11] 'c-make-big-comment)
(fset 'c-make-fixme-comment "\M-;FIXME")
(global-set-key '[C-f11] 'c-make-fixme-comment)
(global-set-key '[SunF37] 'shell)
(fset 'c-disable-region
   [?\C-x ?\C-x ?# ?i ?f ?  ?0 return ?\C-x ?\C-x ?# ?e ?n ?d ?i ?f return])
(global-set-key '[C-f12] 'c-disable-region)
(fset 'c-make-separator
   [?/ ?* ?  ?\M-7 ?\M-4 ?- ?  ?* ?/ down ?\C-a return])
(global-set-key '[f11] 'c-make-separator)

;;; misc settings
(setq default-major-mode 'indented-text-mode)
(add-hook 'indented-text-mode-hook 'turn-on-auto-fill)
(add-hook 'indented-text-mode-hook (function (lambda () (setq fill-column 79))))

; The default behavior for the `*' character is a bit annoying...
(add-hook 'c-mode-hook (function (lambda ()
                                   (local-set-key "*" 'self-insert-command))))
;;;(add-hook 'w3-mode-hook (function (lambda () (w3-lynx-emulation-minor-mode))))
(setq require-final-newline t)
(setq delete-auto-save-files t)
(setq display-time-day-and-date t)
(display-time)
(setq delete-auto-save-files t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;(resize-minibuffer-mode) Commented out by SDM for 22.1


(setq fill-column 79)
(turn-on-auto-fill)
(setq c-default-style "linux" c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(set-background-color "AntiqueWhite")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(load-home-init-file t t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ProggyTinyTTSZ" :foundry "unknown" :slant normal :weight normal :height 145 :width normal)))))


(modify-frame-parameters nil '((wait-for-wm . nil)))
(add-to-list 'load-path "~/.emacs.d/")


;;; GO MODE
;; go-mode-load.el should be in load-path eventually generated by
;; go-mode.el (from https://github.com/dominikh/go-mode.el
;; via M-x update-file-autoloads
(require 'go-mode-load)

;;; gofmt when save
(add-hook 'before-save-hook 'gofmt-before-save)

;;;; to remove unused import
(add-hook 'go-mode-hook (lambda ()
                      (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;;;; go to imports
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))


;;; MD mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
