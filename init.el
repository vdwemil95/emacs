(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Installs packages
;;
;; myPackages contains a list of package names

(defvar myPackages

  '(
    material-theme                  ;; Theme
    elpy                            ;; Python
    ivy
    all-the-icons                   ;; icons
    swiper
    flycheck
    py-autopep8
    blacken
    rainbow-delimiters
    company
    magit                           ;; Git integration
    all-the-icons-dired
    all-the-icons-ivy
    all-the-icons-ibuffer
    )
  )


;; Scans the list in myPackages
;; If the package listed is not already installed, install it

 (mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; Icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(all-the-icons-ivy-setup)
(all-the-icons-ibuffer-mode 1)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; IVY
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; IVY shortcuts
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c F") 'counsel-org-file)


;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy

(setq python-shell-interpreter "python3"
      elpy-rpc-python-command "python3"
      )
(elpy-enable)
;; Enable Flycheck

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; (when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (add-hook 'elpy-mode-hook 'jedi:setup)
;; (setq elpy-rpc-backend "jedi")  
;; (setq jedi:complete-on-dot t)                 ; optional


;; Enable autopep8
(require 'py-autopep8)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(material-light))
 '(custom-safe-themes
   '("afd761c9b0f52ac19764b99d7a4d871fc329f7392dfc6cd29710e8209c691477" default))
 '(package-selected-packages
   '(beacon magit rainbow-delimiters company elpy dashboard flyspell-correct-ivy material-theme nov all-the-icons-ivy all-the-icons all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy-rich counsel swiper org-journal)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 182 :width normal)))))


