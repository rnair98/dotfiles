;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rohit Nair"
      user-mail-address "nair.rohit98@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one
      doom-font (font-spec :family "JetBrainsMono" :size 12 :weight 'light)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 13))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;; :lang org

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "/mnt/e/Polymathy/org/roam")
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
    `(("n" "note" plain
      ,(format "#+title: ${title}\n%%[%s/template/notes.org]" org-roam-directory)
           :target (file "pages/%<%Y%m%d%H%M%S>-${slug}.org" "\n")
           :unnarrowed t)
      ("p" "project" plain
      ,(format "#+title: ${title}\n%%[%s/template/project.org]" org-roam-directory)
           :target (file+head "lab/%<%Y%m%d%H%M%S>-${slug}.org" "#+date: %U\n")
           :unnarrowed t)
      ("r" "references" plain
      ,(format "#+title: ${title}\n%%[%s/template/notes.org]" org-roam-directory)
           :target (file "literature/%<%Y%m%d%H%M%S>-${slug}.org")
           :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)))
  

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
       (apply #'org-roam-node-insert args)))

(setq +org-roam-auto-backlinks-buffer t
      org-directory "/mnt/e/Polymathy/org/roam"
      org-roam-db-location (concat org-directory ".org-roam.db")
      org-roam-dailies-directory "journal/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-agenda-files org-directory)



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
(use-package conda
  :config
  (setq conda-anaconda-home (expand-file-name "~/micromamba"))
  (setq conda-env-home-directory (expand-file-name "~/micromamba"))
  (setq conda-env-subdirectory "envs"))

(unless (getenv "CONDA_DEFAULT_ENV")
  (conda-env-activate "~/micromamba/envs/notebook"))

;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
