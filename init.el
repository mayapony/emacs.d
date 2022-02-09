;; -*- lexical-binding: t -*-
;; (global-set-key (kbd "s-a") 'mark-whole-buffer) ;; 全选
;; the command for saving (coping) text to kill-ring is 'kill-ring-save' (M-w)
;; (global-set-key (kbd "s-c") 'kill-ring-save) ;; 复制 kill-ring is similar to a clipboard
;; (global-set-key (kbd "s-s") 'save-buffer) ;; 保存
;; (global-set-key (kbd "s-v") 'yank) ;; 粘贴
;; (global-set-key (kbd "s-z") 'undo) ;; 撤销
;; (global-set-key (kbd "s-x") 'kill-region) ;; 剪切

(menu-bar-mode -1) ;; 菜单栏
(tool-bar-mode -1) ;; 工具栏
(scroll-bar-mode -1) ;; 滚动条

(global-linum-mode 1) ;; 数字

;; (server-mode 1) win上通过emcas打开

;; 防止出现 saving clipboard to x clipboard 
(setq x-select-enable-clipboard-manager nil)

;; 关闭启动界面
(setq inhibit-startup-screen t)


(setq tab-always-indent 'complete) ;; tab 进行代码complete
(electric-pair-mode t) ;; 成对出现括号
(setq-default cursor-type t) ;; 修改光标样式
(set-face-attribute 'default nil :height 180)

;; 打开配置文件
(defun open-init-file()
  (interactive) ;; 让这个函数能够被调用
  (find-file "~/.emacs.d/init.el")
  )

(global-company-mode 1)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 让鼠标滚轮更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")

			 ("melpa" . "http://elpa.zilongshanren.com/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

;;防止反复调用 package-refresh-contents 会影响加载速度
;;(when (not package-archive-contents)
;;  (package-refresh-contents))

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(keycast-mode t)

;; 增强minibuffer 的补全
(package-install 'vertico)
(vertico-mode t)

;; M-x 模糊搜索
(package-install 'orderless)
(setq completion-styles '(orderless))

;; minibuffer 内显示更加详细的信息
(package-install 'marginalia)
(marginalia-mode t)

;;
(package-install 'embark)
(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

;; 替换默认的 C-s 
(package-install 'consult)
(global-set-key (kbd "C-s") 'consult-line)
;; 显示所有函数
(global-set-key (kbd "M-s i") 'consult-imenu)

(show-paren-mode t)
(setq make-backup-files nil)

;; 保存最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)

;; 使用consult-buffer 代替默认的
(global-set-key (kbd "C-x b") 'consult-buffer)

(delete-selection-mode t)

(defun consult-directory-externally (file)
  "Open FILE externally using the pcmanfm."
  (interactive "fOpen externally: ")
  (shell-command-to-string (encode-coding-string (format "pcmanfm %s" (file-name-directory (expand-file-name file))
							 ) 'gbk )))

(package-install 'embark-consult)
(package-install 'wgrep)
(setq wgrep-auto-save-buffer t)

(global-hl-line-mode 1) ;; 高亮当前行
(package-install 'dracula-theme) ;; 安装 dracula-theme 字体
(load-theme 'dracula 1) ;; 加载主题

(unless (package-installed-p 'evil)
  (package-install 'evil)) ;; vim 模式
(require 'evil)
(evil-mode 1)

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters)) ;; 彩虹括号
(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)

(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))
(doom-modeline-mode 1)

(unless (package-installed-p 'keyfreq)
  (package-install 'keyfreq)) ;; 统计按键频率
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(setq keyfreq-excluded-commands '(self-insert-command
				  forward-char
				  backward-char
				  previous-char
       				  next-line))

(setq org-startup-indented t)

(setq use-package-always-ensure t)

(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :ensure t :commands lsp-ui-mode)
;; if you are helm user
;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp)))) ;; or lsp-deferred

;; optional if you want which-key integration
(use-package which-key
  :ensure t
    :config
    (which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("22f080367d0b7da6012d01a8cd672289b1debfb55a76ecdb08491181dcb29626" default))
 '(lsp-ui-sideline-show-hover t)
 '(package-selected-packages
   '(lsp-pyright which-key use-package keyfreq doom-modeline rainbow-delimiters evil dracula-theme monokai wgrep embark-consult consult embark marginalia orderless vertico keycast company)))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
