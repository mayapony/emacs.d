;; -*- lexical-binding: t -*-
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; Package Management
;; ----------------------------------------------------
(require 'init-packages)

;; UI Management
;; ----------------------------------------------------
(require 'init-ui)

;; Better Defaults Management
;; ----------------------------------------------------
(require 'init-better-defaults)

;; Plugin Management
;; ----------------------------------------------------
(require 'init-plugin)

(setq tab-always-indent 'complete) ;; tab 进行代码complete

;; 打开配置文件
(defun open-init-file()
  (interactive) ;; 让这个函数能够被调用
  (find-file "~/.emacs.d/init.el")
  )

;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-hook 'after-init-hook 
;;   (lambda ()
;;     ((setq company-minimum-prefix-length 1)
;;       (setq company-idle-delay 0)
;;       (define-key company-active-map (kbd "C-n") 'company-select-next)
;;       (define-key company-active-map (kbd "C-p") 'company-select-previous)
;;      )))
;; (setq company-minimum-prefix-length 1)
;; (setq company-idle-delay 0)
;; (define-key company-active-map (kbd "C-n") 'company-select-next)
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; M-x 模糊搜索
(package-install 'orderless)
(setq completion-styles '(orderless))

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


(unless (package-installed-p 'evil)
  (package-install 'evil)) ;; vim 模式
(require 'evil)
(evil-mode 1)


(unless (package-installed-p 'with-editor)
  (package-install 'with-editor))

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


(package-install 'magit)

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

