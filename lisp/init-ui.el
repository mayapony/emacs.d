(menu-bar-mode -1) ;; 菜单栏
(tool-bar-mode -1) ;; 工具栏
(scroll-bar-mode -1) ;; 滚动条
(global-linum-mode 1) ;; 数字
(setq-default cursor-type t) ;; 修改光标样式
(set-face-attribute 'default nil :height 180) ;; 文字大小
(global-hl-line-mode 1) ;; 高亮当前行

;; ;; dracula 主题
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula 1))

;; 彩虹括号
(use-package rainbow-delimiters
  :ensure t
  :config
    (rainbow-delimiters-mode))

;; doom 下面的状态栏样式
(use-package doom-modeline
  :ensure t
  :config
    (doom-modeline-mode))

(provide 'init-ui)
