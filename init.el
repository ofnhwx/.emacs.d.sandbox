
;; 起点のディレクトリを変更
(let ((dir (file-name-directory (or load-file-name buffer-file-name))))
  (setq user-emacs-directory (abbreviate-file-name dir)))

;; package の設定
(progn
  (setq package-archives
        '(("melpa" . "http://melpa.org/packages/")
          ("gnu" . "http://elpa.gnu.org/packages/")
          ("org" . "http://orgmode.org/elpa/")))
  (package-initialize))

;; use-package をインストール
(unless (require 'use-package nil t)
  (package-refresh-contents)
  (package-install 'use-package))

;; 不要なファイルが生成されないように設定
(set-variable 'auto-save-default nil)
(set-variable 'make-backup-files nil)

;; カスタム設定
(let ((custom-file (expand-file-name "init-custom" user-emacs-directory)))
  (when (file-exists-p custom-file))
  (load custom-file))
