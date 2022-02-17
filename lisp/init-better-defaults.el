(setq custom-file (expand-file-name "~/.emacs.d/lisp/custom.el"))
(load custom-file 'no-error 'no-message)

;; 防止出现 saving clipboard to x clipboard 
(setq x-select-enable-clipboard-manager nil)

;; 关闭启动界面
(setq inhibit-startup-screen t)

(electric-pair-mode t) ;; 成对出现括号

;; 让鼠标滚轮更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; (server-mode 1) win上通过emcas打开

(provide 'init-better-defaults)
