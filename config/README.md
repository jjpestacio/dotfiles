# CloudEng Developer Configuration

Shared configuration for style and linters that follow agreed upon rules from Cloud Engineering

## Fixers
[black](https://github.com/psf/black)
[isort](https://github.com/PyCQA/isort)

## Linters
[Flake 8](https://gitlab.com/pycqa/flake8)
[ShellCheck](https://github.com/koalaman/shellcheck#user-content-installing)

## Getting Started
Managing your virutal environments is up to the workflow you prefer, you should install these requirements into the venv of your choice.

```
pip install -r requirements.txt
```

Copy the files in `./config/*` to `~/.config/`

```
mkdir -p ~/.config
cp -r ./config/* ~/.config
```

## Enabling the configuration in your editor:
### Vim + VIMAle
 * Install VIMAle: https://github.com/dense-analysis/ale
```
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_quickfix = 1 " useful quickfix split
let g:ale_open_list = 1
let g:ale_lint_delay = 500 " dont lint so much as you type
let g:ale_set_highlights = 1
" disable auto-detect virtualenv, this will use your current environment venv
let g:ale_virtualenv_dir_names = []

" for each python project, collect modules defined in the root of the project for special isort-ing
let python_project_modules = glob(ale#python#FindProjectRoot(bufnr('%')) . '/*/__init__.py', 0, 1)
let isort_project_config = join(map(python_project_modules, '''-p '' . fnamemodify(v:val, '':h:t'')'), ' ')

let g:ale_python_isort_options = '--settings-path ~/.config/.isort.cfg' . isort_project_config 
let g:ale_python_black_options = '--line-length 99'
let g:ale_linters = {'python': ['pyls'], 'sh': 'shellcheck'}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
```

### Emacs
Emacs can make good use of yapf and flake8.  In the below configuration it
will run yapf whenever a file is saved, and flake8 will supply useful
error information while editing a file.

To setup Emacs to use yapf and flake8, please do the following:

Prerequisites:
 * Use the package installer to install: use-package, flycheck, and yapfify.
 * See the example emacs-init.el file for an example setup if needed.

Install a package with the following commands:
 * ```M-x package-list-packages```
 * Mark each package with an "i"
 * "x" to install

NOTE! it may be necessary to add some code to enable access to
the emacs package repositories.  See the example emacs-init.el for
how to do that.

Once the packages are installed, you can add the following code
to your .emacs file:
```
;; Setup 'use-packe, which will be used to enable flycheck
(eval-when-compile
  (require 'use-package))

;; Enable yapf when editing a Pythong file.
(add-hook 'python-mode-hook 'yapf-mode)

;; Setup flycheck

;; (setf flycheck-flake8rc "~/.config/flake8")  ;; This may not be needed.
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Turn off pylint
(setq-default flycheck-disabled-checker '(python-pylint))
```


### Sublime
 *  This assumes you are using Sublime 3, and already have that installed.
 *  Follow these steps (from https://packagecontrol.io/packages/PyYapf%20Python%20Formatter):
    1.  If not already done, execute from some suitable root location (on Mac, your Home directory):
        *  do *not* install to a virtual-env!
        *  `pip install yapf`
    1.  If not already done: Install Sublime Package Control: https://packagecontrol.io/installation
    1.  Ctrl-Shift-P (Mac: Cmd-Shift-P) and choose “Package Control: Install Package”:
        *  find “PyYapf Python Formatter” in the list (enter a few characters and you should see it).
    1.  Edit the PyYapf.sublime-settings file:
        *  go to Sublime Text => Preferences => Package Settings => PyYapf => Settings
        *  copy into the `"config": {}` of that file the settings from
           https://git.tcc.li/projects/C/repos/dev-config/browse/config/yapf/
        *  if you also set `"on_save": true,` at the top level in that file,
           the formatter will run on every Save.

## Deployments/Rollback
dev-config are simply configurations intended to be applied to a users local machine. There are no configured deployments.

## Standard Operating Procedure
* [Miscellaneous Service SOP](https://go.tcc.li/ce-misc-sop)
