;; This is my configuration file
;; Aim: keep it as light as possible (say under 300 lines)
;;      so that the config stays understandable, manageable and fast
(setq custom-file "~/.config/emacs/emacs-custom.el")
(load custom-file)

;; Changing annoying defaults
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode -1)
(show-paren-mode -1)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)

;; Theme and font
(set-face-attribute 'default nil :family "Iosevka Nerd Font" :height 130)

(use-package tokyonight-themes
  :vc (:url "https://github.com/xuchengpeng/tokyonight-themes")
  :config
  (load-theme 'tokyonight-storm :no-confirm))

;; Minibuffer completions
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))
