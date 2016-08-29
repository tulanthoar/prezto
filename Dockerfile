FROM alpine:edge

RUN printf >/tmp/sourceme '%s\n'\
 'apk add --no-cache python3 git rsync musl-dev gcc ca-certificates openssl ctags perl'\
 'apk add neovim --update-cache --repository http://dl-2.alpinelinux.org/alpine/edge/testing/ --allow-untrusted'\
 'apk add neovim --update-cache --repository http://dl-6.alpinelinux.org/alpine/edge/testing/ --allow-untrusted'\
 'python3 -m ensurepip'\
 'pip3 install --upgrade pip setuptools neovim jedi'\
 'ln -s /usr/bin/python3.5 /usr/bin/python'\
 'mkdir -p /root/.config/nvim/bundle'\
 'wget -O /root/.config/nvim/init.vim http://raw.githubusercontent.com/tulanthoar/prezto/master/dotfiles/nvim/init.vim'\
 'git clone http://github.com/VundleVim/Vundle.vim.git /root/.config/nvim/bundle/Vundle.vim'\
 'perl <"/root/.config/nvim/init.vim" -p -e "s/^colorscheme kolor$//" > /tmp/viminit && nvim -u /tmp/viminit +PluginInstall +qall'\
 'echo "install"'\
 'printf>/patterns "^%svim$\n" "" "initex." "java." "diff." "readline." "html." "lua." "python." "help." "markdown." "make." "json." "cmake."\
 "automake." "matlab." "git." "syncolor." "cpp." "texmf." "config." "man." "manual." "conf." "Dockerfile." "godoc." "chaskell."\
 "tex." "vim." "sh." "zsh." "perl." "texinfo." "c." "plaintex." "haskell." "go." "pod." "lhaskell." "gitcommit." "gitconfig." "tags." "master." "syntax."'\
 'ls -1 /usr/share/nvim/runtime/syntax > /targets'\
 'grep -Ev -f /patterns /targets |xargs -n1 echo|perl -pe "$ARG = qq(/usr/share/nvim/runtime/syntax/).$ARG"| xargs -n1 rm -f'\
 'echo "syntax"'\
 'printf "/usr/lib/perl5/core_perl/auto/Encode/%s\n" "CN" "JP" "KR" "TW" | xargs rm -rf'\
 'echo "encode"'\
 'for d in $(printf "%s " ".git" "__pycache__" "doc" "test" "t" "tests" "test-files" "test-case");'\
 'do find /root -type d -name "$d" | xargs -n1 rm -rf'\
 'done'\
 'echo "dirs"'\
 'for f in $(printf "%s " "png" "rst" "md" "md" "svg" "gif" "txt" "exe");'\
 'do find / -type f -name "*.${f}" -delete'\
 'done'\
 'for f in $(printf "%s " "README" "LICENSE");'\
 'do find / -type f -name "${f}.*" -delete'\
 'done'\
 'find /usr -type f -name "*.pod" -delete'\
 'rm -rf /usr/lib/python*/ensurepip'\
 'rm -rf /root/.cache'\
 'rm /usr/share/nvim/runtime/doc -rf'\
 'rm /usr/lib/python3.5/idlelib/Icons -rf'\
 'rm /usr/lib/python3.5/idlelib/idle_test -rf'\
 'find /usr/lib/python3.5 -type d -name "__pycache__" -print0|xargs -0n1 rm -rf'\
 'rm /usr/share/nvim/runtime/autoload/phpcomplete.vim'\
 'rm /usr/share/ca-certificates/mozilla/*'\
 'rm /usr/share/locale -rf'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*arm*'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*386*'\
 'mv /root/.config/nvim/bundle/vim-ctrlspace/bin/*linux* /root/.config/nvim/bundle/vim-ctrlspace/'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*amd*'\
 'mv /root/.config/nvim/bundle/vim-ctrlspace/file_engine*linux* /root/.config/nvim/bundle/vim-ctrlspace/bin'\
 'find /usr/share/terminfo/ -type f -print0|perl -0ne "print $ARG.qq(\n) unless /xterm/"|xargs -0n1 rm -f'\
 'apk del --purge git openssl musl-dev gcc rsync ca-certificates openssl'\
 'echo "apk"'\
 && cat /tmp/sourceme\
 && source /tmp/sourceme && rm -f /tmp/sourceme
