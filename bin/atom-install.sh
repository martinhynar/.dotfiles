#!/bin/bash



if [ $# -gt 0 -a "x$1" == "x--atom" ]; then
  echo "Re-installing atom ..."
  wget https://atom.io/download/rpm -o /tmp/atom.rpm
  sudo dnf install /tmp/atom.rpm
else
  echo "Use --atom to reinstall Atom itself"
fi

apm install \
  aligner-php \
  atom-beautify \
  atom-ctags \
  autocomplete-erlang \
  autocomplete-php \
  color-picker \
  emmet \
  file-icons \
  git-time-machine \
  highlight-line \
  language-elm \
  language-erlang \
  language-javascript \
  language-r \
  linter \
  linter-clojure \
  linter-csslint \
  linter-erlang \
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
  sass-autocompile
