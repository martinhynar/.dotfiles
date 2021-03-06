#!/bin/bash



if [ $# -gt 0 -a "x$1" == "x--atom" ]; then
  echo "Re-installing atom ..."
  wget https://atom.io/download/rpm -O /tmp/atom.rpm
  sudo dnf install /tmp/atom.rpm
else
  echo "Use --atom to reinstall Atom itself"
fi

apm install \
  aligner-php \
  atom-beautify \
  atom-ctags \
  autocomplete-php \
  color-picker \
  emmet \
  file-icons \
  git-plus \
  highlight-line \
  language-r \
  intentions \
  busy-signal \
  linter \
  linter-ui-default \
  linter-clojure \
  linter-csslint \
  linter-htmlhint \
  linter-javac \
  linter-js-yaml \
  linter-jsonlint \
  linter-lintr \
  linter-php \
  linter-phpcs \
  linter-phpmd \
  linter-shellcheck \
  linter-tidy \
  linter-xmllint \
  minimap \
  php-composer-completion \
  php-cs-fixer \
  project-manager \
  atom-html-preview \
  proto-repl \
  lisp-paredit \
  Ink \
  rainbow-delimiters \
  parinfer
