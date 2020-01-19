(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/") t)

(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(lsp-treemacs helm-lsp helm-swoop swoop yasnippet company-lsp company-go go-mode flycheck-rust toml-mode cargo rust company flycheck fly-check lsp-ui lsp-mode helm-projectile projectile helm-org evil-magit magit evil helm use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(use-package magit
  :ensure t
  :init)

;; this is the way
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1))

(use-package evil-magit
  :ensure t
  :bind (([f12] . magit-status))
  :init)

;; this is annoying in evil mode, unset it
(global-unset-key (kbd "M-:"))
(global-unset-key (kbd "M-ESC :"))

(use-package swoop
  :ensure t
  :init)

(use-package helm
  :ensure t
  :bind (("C-x C-b" . helm-buffers-list)
         ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-h a" . helm-apropos)
	 ([f5] . helm-imenu)
	 )
  :init)

(use-package helm-swoop
  :ensure t
  :bind ("C-h C-s" . helm-multi-swoop-all)
  :init)

(use-package helm-org
  :ensure t
  :init)

(use-package helm-projectile
  :ensure t
  :bind (("C-c C-p f" . helm-projectile)
         ("C-c C-p s" . helm-projectile-switch-project))
  :init)

(use-package helm-lsp
  :ensure t
  :init)

(use-package projectile
  :ensure t
  :init)

;; Development
;; -----------
(use-package lsp-mode
  :commands (lsp company-mode projectile-mode)
  :bind (([f3] . lsp-find-definition)
	 ([f4] . lsp-find-references))
  :config
  (electric-pair-mode 1)
  (yas-minor-mode 1)
  ;; for angular. Requires:
  ;; npm install -g @angular/language-service@next typescript @angular/language-server
  (setq lsp-clients-angular-language-server-command
      '("node"
	"/usr/lib/node_modules/@angular/language-server"
	"--ngProbeLocations"
	"/usr/lib/node_modules"
	"--tsProbeLocations"
	"/usr/lib/node_modules"
	"--stdio"))
  (setq lsp-enable-completion-at-point t)
  ;; for python. Requires:
  ;; pip3 install python-language-server
  ;; for rust. Requires rls
  (setq lsp-rust-rls-server-command '("rls"))

  
  :ensure t
  :init)

(use-package lsp-treemacs
  :ensure t
  :init)

;; autocompletion
(use-package company
  :ensure t
  :bind (([tab] . company-complete-common-or-cycle)
         ("TAB" . company-complete-common-or-cycle))

  :init (global-company-mode))

(use-package company-lsp
  :ensure t
  :init)

(use-package python
  :ensure t
  :hook ((python-mode python-mode-hook) . lsp)
  :init)

;; this adds some smarter completion of arguments when paired with company
(use-package yasnippet
  :ensure t
  :init)

(use-package toml-mode
  :ensure t)

(use-package go-mode
  :ensure t
  :config 
  (setq gofmt-command "goimports")
  (setq compile-command "go build -v && go test -v && go vet")
  :bind ("C-c C-c" . compile)
  :hook (go-mode . lsp)
  :init
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package company-go
  :ensure t
  :init)

(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp)
  :init)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(use-package cargo
  :ensure t
  :diminish cargo-minor-mode
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck
  :ensure t
  :init)

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; requires flycheck
(use-package lsp-ui
  :ensure t
  :init)




;; -----------

;; persist sessions
(desktop-save-mode 1)

;; exclude backup files
(setq make-backup-files nil)
