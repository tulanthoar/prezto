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
    nvim +UpdateRemotePlugins +qall && echo 'export TERM="${TERM}-256"' >> /etc/profile && \
    rm -r /root/.cache && find / -name "__pycache__" -type d -print0 | xargs -0n1 rm -rf && \
find /root/.config/nvim/bundle -name ".git" -type d -print0 | xargs -0n1 rm -rf && find /root/.config/nvim/bundle -name "test" -type d -print0 | xargs -0n1 rm -rf
