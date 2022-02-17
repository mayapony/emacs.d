(menu-bar-mode -1) ;; 菜单栏
(tool-bar-mode -1) ;; 工具栏
(scroll-bar-mode -1) ;; 滚动条
(global-linum-mode 1) ;; 数字
(setq-default cursor-type t) ;; 修改光标样式
(set-face-attribute 'default nil :height 180) ;; 文字大小
(global-hl-line-mode 1) ;; 高亮当前行

(package-install 'dracula-theme) ;; 安装 dracula-theme 字体
(load-theme 'dracula 1) ;; 加载主题


(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters)) ;; 彩虹括号
(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)


(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))
(doom-modeline-mode 1)
(provide 'init-ui)
