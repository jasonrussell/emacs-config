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
   '(company flycheck fly-check lsp-ui lsp-mode helm-projectile projectile helm-org evil-magit magit evil helm use-package)))
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

(use-package helm
  :ensure t
  :bind (("C-x C-b" . helm-buffers-list)
         ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-h a" . helm-apropos)
	 ([f5] . helm-imenu)
	 )
  :init)

(use-package helm-org
  :ensure t
  :init)

(use-package helm-projectile
  :ensure t
  :bind (("C-c C-p f" . helm-projectile)
         ("C-c C-p s" . helm-projectile-switch-project))
  :init)

(use-package projectile
  :ensure t
  :init)

;; Development
;; -----------
(use-package lsp-mode
  :commands (lsp company-mode)
  :config
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
  ;; for python. Requires:
  ;; pip3 install python-language-server

  
  :ensure t
  :init)

;; autocompletion
(use-package company
  :bind (([tab] . company-complete)
         ("TAB" . company-complete))
  :ensure t
  :init (global-company-mode))

(use-package python
  :ensure t
  :hook ((python-mode python-mode-hook) . lsp)
  :init)

(use-package flycheck
  :ensure t
  :init)

;; requires flycheck
(use-package lsp-ui
  :ensure t
  :init)




;; -----------

;; persist sessions
(desktop-save-mode 1)

;; exclude backup files
(setq make-backup-files nil)
