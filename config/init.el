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
 '(package-selected-packages '(evil-magit magit evil helm use-package)))
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

(use-package helm
  :ensure t
  :bind (("C-x C-b" . helm-buffers-list)
         ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 )
  :init)



