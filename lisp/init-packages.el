(unless (package-installed-p 'use-package)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (package-install 'use-package))

(setq use-package-always-ensure t)

(use-package company
 :ensure t
 :bind
    (("C-n" . 'company-select-next)
	    ("C-p" . 'company-select-previous))
 :config
    (global-company-mode)
    (setq company-minimum-prefix-length 1)
    (setq company-idle-delay 0))

(provide 'init-packages)
