;; 使用wakatime记录使用时长
(use-package wakatime-mode
  :ensure t
  :config
  (global-wakatime-mode))

;; 使用vertico增强minibuffer的补全
(use-package vertico
  :ensure t
  :config
  (vertico-mode))

;; minibuffer 内显示更加详细的信息
(use-package marginalia
  :ensure t)

(provide 'init-plugin)
