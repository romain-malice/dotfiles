;; This is my configuration file
;; Aim: keep it as light as possible (say under 300 lines)
;;      so that the config stays understandable, manageable and fast

;; Defaults
(setq-default cursor-type 'box)
(setq inhibit-startup-screen nil)
(setq ring-bell-function 'ignore)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 0)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; (blink-cursor-mode -1)
(global-display-line-numbers-mode 1)
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode -1))))

(defun my/get-system-theme ()
  "Detect if system is using dark mode."
  (let ((result (shell-command-to-string 
                 "gsettings get org.gnome.desktop.interface color-scheme")))
    (string-match-p "dark" result)))

(if (my/get-system-theme)
    (load-theme 'modus-vivendi t)
    (load-theme 'modus-operandi t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle))

;; These parameters were generated automatically
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/exam-schedule.org"))
 '(package-selected-packages
   '(auctex doc-toc evil magit olivetti org-fragtog ox-reveal pdf-tools)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Do not modify them. These functions should appear once in the file

;; --------------------------------------------------------------- ;;

(set-face-attribute 'default nil
		    :family "CaskaydiaCove Nerd Font"
		    :height 130
		    :weight 'regular)
(set-face-attribute 'variable-pitch nil
		    :family "Source Sans 3"
		    :height 140)
(set-face-attribute 'fixed-pitch nil
		    :family "CaskaydiaCove Nerd Font"
		    :height 130
		    :weight 'regular)

(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)

(setq modus-themes-mixed-fonts t)

;; --------------------------------------------------------------- ;;
(use-package org
  :ensure nil
  :hook ((org-mode . org-indent-mode)
	 (org-mode . variable-pitch-mode))
  :config
  (setq org-startup-with-inline-images t)
  (setq org-startup-with-latex-preview t)
  (setq org-startup-folded t)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-highlight-latex-and-related '(latex script))
  (setq org-format-latex-options 
	(plist-put
	 (plist-put
	  (plist-put
	   org-format-latex-options :scale 1.3)
	  :background "Transparent")
	 :foreground 'default))
  ;; Resize Org headings
  (dolist (face '((org-level-1 . 1.35)
		  (org-level-2 . 1.3)
		  (org-level-3 . 1.2)
		  (org-level-4 . 1.1)
		  (org-level-5 . 1.1)
		  (org-level-6 . 1.1)
		  (org-level-7 . 1.1)
		  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :family "Source Sans 3" :weight 'bold :height (cdr face)))

  ;; Make the document title a bit bigger
  (set-face-attribute 'org-document-title nil :family "Source Sans 3" :weight
		      'bold :height 1.8)

  (require 'org-indent)
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-block nil            :foreground nil :inherit
		      'fixed-pitch :height 0.85)
  (set-face-attribute 'org-code nil             :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-indent nil           :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-verbatim nil         :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil  :inherit '(font-lock-comment-face
							   fixed-pitch))
  (set-face-attribute 'org-meta-line nil        :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil         :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-document-info-keyword nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-latex-and-related nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-drawer nil :inherit '(font-locked-comment_face fixed-pitch))

  (setq org-adapt-indentation t
      org-hide-leading-stars t
      org-pretty-entities t))

(use-package org-fragtog
  :ensure t
  :hook org-mode)

(use-package olivetti
  :ensure t
  :hook (org-mode . olivetti-mode))

(use-package ox-reveal
  :ensure t)

;; Define preset scales for different monitors
(defun my/org-latex-preview-laptop ()
  "Set LaTeX preview scale for laptop screen."
  (interactive)
  (plist-put org-format-latex-options :scale 0.6)
  (org-latex-preview '(16))) ; Regenerate previews

(defun my/org-latex-preview-external ()
  "Set LaTeX preview scale for external monitor."
  (interactive)
  (plist-put org-format-latex-options :scale 1.3)
  (org-latex-preview '(16))) ; Regenerate previews

;; --------------------------------------------------------------- ;;

(use-package pdf-tools
  :defer t
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :bind (:map pdf-view-mode-map
	      ("j" . pdf-view-next-line-or-next-page)
	      ("k" . pdf-view-previous-line-or-previous-page)
	      ("C-=" . pdf-view-enlarge)
	      ("C--" . pdf-view-shrink))
  :commands (pdf-loader-install))

(add-hook 'pdf-view-mode-hook #'(lambda () (display-line-numbers-mode -1)))

;; --------------------------------------------------------------- ;;

(use-package tex
  :ensure auctex
  :config
  ;; Enable document parsing
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  
  ;; Enable SyncTeX
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (setq TeX-source-correlate-method 'synctex)
  
  ;; PDF mode by default
  (setq TeX-PDF-mode t)
  
  ;; Auto-recompile on save
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'TeX-command-run-all nil t))))

; --------------------------------------------------------------- ;;

(use-package magit
  :ensure t)
