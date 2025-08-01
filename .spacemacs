;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '((shell-scripts :variables
                    shell-scripts-format-on-save t
                    shell-scripts-backend nil)
     ansible
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-help-tooltip t)
     (c-c++ :variables
            c-c++-backend 'lsp-clangd)
     (clojure :variables clojure-backend 'cider)
     csv
     dap
     (docker :variables
             docker-dockerfile-backend nil)
     (elixir :variables
             elixir-backend 'alchemist)
     emacs-lisp
     git
     (go :variables
         go-use-golangci-lint t
         go-format-before-save t
         go-backend 'lsp)
     html
     ivy
     java
     javascript
     (json :variables json-backend nil)
     kubernetes
     lsp
     markdown
     multiple-cursors
     ;; https://www.spacemacs.org/layers/+emacs/org/README.html#important-note
     ;; don't customize any behavior for `org' here put it in the user-config block
     org
     protobuf
     (python :variables
             python-backend 'lsp)
     puppet
     (ruby :variables
           ruby-backend 'lsp
           ruby-insert-encoding-magic-comment t
           ruby-version-manager 'rvm)
     rust
     (scala :variables
            scala-sbt-window-position 'bottom
            scala-auto-insert-asterisk-in-comments t)
     (shell :variables shell-default-shell 'vterm
            shell-default-term-shell "/bin/bash"
            spacemacs-vterm-history-file-location "~/.bash_history"
            close-window-with-terminal t)
     (spell-checking :variables spell-checking-enable-by-default t)
     sql
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t
                      syntax-checking-enable-by-default t)
     systemd
     terraform
     treemacs
     typescript
     vimscript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(doom-themes sqlite3 cmake-mode xclip)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 997
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (bookmarks . 10))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-dracula spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Iosevka Nerd Font"
                               :size 11
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; the config below is deprecated and has been moved to 'evil-want-Y-yank-to-eol
   ;; vim-style-remap-Y-to-y$ t
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 20
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         pdf-view-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; KEYBINDINGS
  (global-set-key (kbd "C-+") 'spacemacs/scale-up-font)
  (global-set-key (kbd "C--") 'spacemacs/scale-down-font)
  (global-set-key (kbd "M-/") 'counsel-rg)
  (spacemacs/declare-prefix "o" "user")
  (spacemacs/set-leader-keys "oc" 'counsel-imenu)
  (spacemacs/set-leader-keys "om" 'mc/mark-next-like-this)
  ;; BEHAVIOR CHANGES
  (add-hook 'org-after-todo-statistics-hook
            (lambda (n-done n-not-done)
              "Switch entry to DONE when all subentries are done, to IN-PROGRES otherwise."
              (let (org-log-done org-log-states)   ; turn off logging
                (org-todo (if (= n-not-done 0) "DONE" "IN-PROGRESS")))))
  (global-company-mode)
  (setq flycheck-checker-error-threshold 500
        flycheck-display-errors-delay 2
        flycheck-pos-tip-timeout 5
        fancy-battery-show-percentage nil
        imenu-max-item-length 120
        fancy-battery-mode nil
        kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600
        terminal-here-linux-terminal-command 'kitty
        projectile-fd-executable "fd")
  ;; One thing to note - `projectile` should be
  ;; As of writing this doc - it seems that `projectile-find-file'
  ;; depends entirely on the `projectile-generic-command' which
  ;; by default uses `find' but if the alternative `fd'
  ;; exists - it will use that. 5/7 would recommend install `fd'
  ;; https://github.com/sharkdp/fd#installation
  ;; To be able to use `lsp via tramp (for ruby at least):
  ;; > You need solargraph installed on the remote host
  ;; > You need to tell tramp to
  ;;   1. look in the correct path for the `solargraph` executable via
  ;;      `tramp-remote-path'
  ;;   2. tell tramp what to run via `solargraph stdio'
  ;; (with-eval-after-load 'lsp-mode
  ;;   (lsp-register-client
  ;;    (make-lsp-client :new-connection (lsp-tramp-connection '("solargraph" "stdio"))
  ;;                     :major-modes '(ruby-mode)
  ;;                     :remote? t
  ;;                     :server-id 'solargraph-remote)))
  ;; Ref: https://github.com/emacs-lsp/lsp-mode/blob/057e8789638a0bf493930637185694b6b09ea58e/lsp-rust.el#L303
  ;; Ref: https://github.com/emacs-lsp/lsp-metals/blob/da7e54ed65f4e153c94b9c54689908dce142ef37/lsp-metals.el#L940-L977
  ;; NOTE: The idea is to make the tramp connection just like the layer normally would except that it would
  ;; normally make it on an 'lsp-stdio-connection and we would make it on an 'lsp-tramp-connection since we're
  ;; interacting with a container
  ;; (with-eval-after-load 'lsp-mode
  ;; (add-hook 'lsp-after-uninitialized-functions #'lsp-metals--on-workspace-shutdown)
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-tramp-connection "metals-emacs")
  ;;                   :major-modes '(scala-mode)
  ;;                   :priority -1
  ;;                   :remote? t
  ;;                   :server-id 'metals-remote
  ;;                   :completion-in-comments? t))
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
  ;;                   :major-modes '(c-mode c++-mode)
  ;;                   :remote? t
  ;;                   :server-id 'clangd-remote))
  ;; ;; Ref: https://github.com/emacs-lsp/lsp-mode/blob/5550e12616cbe7fbe9d85bd0a8bd504abeb54f4b/clients/lsp-go.el#L320-L331
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-tramp-connection '("gopls" "-remote=auto" "-remote.logfile=gopls.log"))
  ;;                   :major-modes '(go-mode)
  ;;                   :language-id "go"
  ;;                   :completion-in-comments? t
  ;;                   :activation-fn (lsp-activate-on "go" "go.mod")
  ;;                   :remote? t
  ;;                   :library-folders-fn #'lsp-go--library-default-directories
  ;;                   :server-id 'gopls-remote
  ;;                   :after-open-fn (lambda ()
  ;;                                    ;; https://github.com/golang/tools/commit/b2d8b0336
  ;;                                    (setq-local lsp-completion-filter-on-incomplete nil))))
  ;; )
  ;; (eval-after-load "hideshow"
  ;;   '(add-to-list 'hs-special-modes-alist
  ;;                 `(ruby-mode
  ;;                   ,(rx (or "do" "{" "[" "if" "else" "unless" "def" "class" "module" )) ; Block start
  ;;                   ,(rx (or "}" "]" "end"))                       ; Block end
  ;;                   ,(rx (or "#" "=begin"))                        ; Comment start
  ;;                   ruby-forward-sexp nil)))
  (xclip-mode 1)
  ;; https://www.spacemacs.org/layers/+emacs/org/README.html#important-note
  (with-eval-after-load 'org
    (setq org-agenda-files (file-expand-wildcards "~/todos/*.org"))
    ;; https://orgmode.org/manual/Template-elements.html
    ;; https://orgmode.org/manual/Template-expansion.html#Template-expansion-1
    (setq org-capture-templates
          '(("t" "Todo for clarisights" entry (file "~/todos/clarisights.org")
             "* TODO %?\n  %t"))))
  (with-eval-after-load 'tramp
    (setq tramp-default-user "emacs")
    (add-to-list 'tramp-connection-properties (list (regexp-quote "ssh:emacs@*") "remote-shell" "/bin/bash"))
    (cl-pushnew 'tramp-own-remote-path tramp-remote-path))
  (with-eval-after-load 'lsp-metals
    (setq lsp-log-io t))
  (with-eval-after-load 'ruby-mode
    (setq ruby-test-runner 'rspec)
    (setq lsp-disabled-clients '(rubocop-ls-tramp sorbet-ls-tramp rubocop-ls sorbet-ls))
    (setq lsp-ruby-lsp-use-bundler t)))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-beautify systemd livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc go-guru go-eldoc csv-mode company-go go-mode coffee-mode yapfify terraform-mode hcl-mode pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic yaml-mode sql-indent smeargle rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake orgit mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-popup helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient disaster company-statistics company-c-headers company cmake-mode clang-format chruby bundler inf-ruby auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(ansi-color-faces-vector
     [default bold shadow italic underline bold bold-italic bold])
   '(enable-remote-dir-locals t)
   '(evil-want-Y-yank-to-eol t)
   '(fci-rule-color "#37474f")
   '(flycheck-check-syntax-automatically '(save mode-enabled))
   '(hl-sexp-background-color "#1c1f26")
   '(ivy-case-fold-search-default nil)
   '(package-selected-packages
     '(ac-ispell ace-jump-helm-line ace-link ace-window adaptive-wrap
                 aggressive-indent anaconda-mode anzu async auto-compile
                 auto-complete auto-dictionary auto-highlight-symbol
                 auto-yasnippet avy bind-key bind-map bundler chruby clang-format
                 clean-aindent-mode cmake-mode coffee-mode column-enforce-mode
                 company company-anaconda company-c-headers company-go
                 company-statistics csv-mode cython-mode dash dash-functional
                 define-word diminish disaster dumb-jump elisp-slime-nav epl
                 eval-sexp-fu evil evil-anzu evil-args evil-ediff evil-escape
                 evil-exchange evil-iedit-state evil-indent-plus evil-lisp-state
                 evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers
                 evil-search-highlight-persist evil-surround evil-tutor
                 evil-unimpaired evil-visual-mark-mode evil-visualstar
                 exec-path-from-shell expand-region eyebrowse f fancy-battery
                 fill-column-indicator flx flx-ido flycheck flycheck-pos-tip
                 flyspell-correct flyspell-correct-helm fuzzy gh-md git-commit
                 git-link git-messenger git-timemachine gitattributes-mode
                 gitconfig-mode gitignore-mode go-eldoc go-guru go-mode
                 golden-ratio google-translate goto-chg hcl-mode helm helm-ag
                 helm-c-yasnippet helm-company helm-core helm-descbinds helm-flx
                 helm-gitignore helm-make helm-mode-manager helm-projectile
                 helm-pydoc helm-swoop helm-themes highlight highlight-indentation
                 highlight-numbers highlight-parentheses hl-todo hungry-delete
                 hy-mode hydra iedit indent-guide inf-ruby js-doc js2-mode
                 js2-refactor json-mode json-reformat json-snatcher link-hint
                 linum-relative live-py-mode livid-mode lorem-ipsum lv macrostep
                 magit magit-gitflow magit-popup markdown-mode markdown-toc
                 minitest mmm-mode move-text multiple-cursors neotree
                 open-junk-file org-bullets org-plus-contrib orgit packed paradox
                 parent-mode pcre2el persp-mode pip-requirements pkg-info popup
                 popwin pos-tip powerline projectile py-isort pyenv-mode pytest
                 pythonic pyvenv rainbow-delimiters rake rbenv request
                 restart-emacs robe rspec-mode rubocop ruby-test-mode ruby-tools
                 rvm s seeing-is-believing simple-httpd skewer-mode smartparens
                 smeargle spaceline spinner sql-indent systemd terraform-mode
                 toc-org transient undo-tree use-package uuidgen vi-tilde-fringe
                 volatile-highlights web-beautify which-key winum with-editor
                 ws-butler yaml-mode yapfify yasnippet))
   '(sqlfmt-options '("- "))
   '(vc-annotate-background nil)
   '(vc-annotate-color-map
     '((20 . "#f36c60") (40 . "#ff9800") (60 . "#fff59d") (80 . "#8bc34a")
       (100 . "#81d4fa") (120 . "#4dd0e1") (140 . "#b39ddb") (160 . "#f36c60")
       (180 . "#ff9800") (200 . "#fff59d") (220 . "#8bc34a") (240 . "#81d4fa")
       (260 . "#4dd0e1") (280 . "#b39ddb") (300 . "#f36c60") (320 . "#ff9800")
       (340 . "#fff59d") (360 . "#8bc34a")))
   '(vc-annotate-very-old-color nil)
   '(vterm-always-compile-module t)
   '(warning-suppress-log-types
     '(((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))))
   '(warning-suppress-types
     '(((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files))
       ((defvaralias losing-value ac-user-dictionary-files)))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )
