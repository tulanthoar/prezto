FROM alpine:edge

RUN apk add --no-cache python3 git rsync musl-dev gcc ca-certificates openssl ctags perl && \
    apk add neovim --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools neovim jedi && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    mkdir -p /root/.config/nvim/bundle && \
    wget -O /root/.config/nvim/init.vim http://raw.githubusercontent.com/tulanthoar/prezto/master/dotfiles/nvim/init.vim && \
    git clone http://github.com/VundleVim/Vundle.vim.git /root/.config/nvim/bundle/Vundle.vim && \
    perl <"/root/.config/nvim/init.vim" -p -e 's/^colorscheme kolor$//' > /tmp/viminit && nvim -u /tmp/viminit +PluginInstall +qall && \
    nvim +UpdateRemotePlugins +qall && \
    apk del --purge gcc rsync ca-certificates openssl && \
    rm -rf /root/.cache && \
    printf '%s\n' '^vim$' '^initex.vim$' '^java.vim$' '^diff.vim' '^readline.vim$' '^html.vim$' '^lua.vim$' '^python.vim$' '^help.vim$' '^markdown.vim$' '^make.vim$' '^json.vim$' '^cmake.vim$' '^automake.vim$' '^matlab.vim$' '^git.vim$' '^syncolor.vim$' '^cpp.vim$' '^texmf.vim$' '^config.vim$' '^man.vim$' '^manual.vim$' '^conf.vim$' '^Dockerfile.vim$' '^godoc.vim$' '^chaskell.vim$' '^tex.vim$' '^vim$.vim$' '^sh.vim$' '^zsh.vim$' '^perl.vim$' '^texinfo.vim$' '^c.vim$' '^plaintex.vim$' '^haskell.vim$' '^go.vim$' '^pod.vim$' '^lhaskell.vim$' '^gitcommit.vim$' '^gitconfig.vim$' '^tags.vim$' '^master.vim$' '^syntax.vim$' > /patterns && \
  ls -1 /usr/share/nvim/runtime/syntax > /targets && \
    grep -Ev -f /patterns /targets |xargs -n1 echo|perl -pe '$_ = "/usr/share/nvim/runtime/syntax/".$_'| xargs -n1 rm -f && \
    printf '/usr/lib/perl5/core_perl/auto/Encode/%s\n' 'CN' 'JP' 'KR' 'TW' | xargs rm -rf && \
  rm /usr/lib/python3.5/idlelib/Icons -rf && \
    rm /usr/lib/python3.5/idlelib/idle_test -rf && \
    rm /usr/share/ca-certificates/mozilla/* && \
    rm /usr/share/locale -rf && \
  for d in $(printf '%s ' ".git" "__pycache__" "doc" "test" "t" "tests" "test-files" "test-case"); do find / -type d -name "$d" -delete; done && \
  for f in $(printf '%s ' "png" "rst" "md" "md" "svg" "gif" "txt" "exe"); do find / -type f -name "*.${f}" -delete; done && \
    for f in $(printf '%s ' "README" "LICENSE"); do find / -type f -name "${f}.*" -delete; done && \
  rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*arm* && \
    rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*386* && \
    mv /root/.config/nvim/bundle/vim-ctrlspace/bin/*linux* /bundle/vim-ctrlspace/ && \
    rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*amd* && \
    mv /root/.config/nvim/bundle/vim-ctrlspace/file_engine*linux* /root/.config/nvim/bundle/vim-ctrlspace/bin
