FROM alpine:edge

RUN printf >/tmp/sourceme '%s\n'\
 'apk add --no-cache python3 git zsh rsync musl-dev gcc ca-certificates openssl ctags perl perl-dev curl make'\
 'apk add neovim --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/testing/ --allow-untrusted'\
 'apk add neovim --no-cache --repository http://dl-6.alpinelinux.org/alpine/edge/testing/ --allow-untrusted'\
 'git clone --depth 1 https://github.com/junegunn/fzf.git /.fzf'\
 'mv /.fzf/fzf /usr/bin' 'mv /.fzf/bin/fzf-tmux /usr/bin'\
 'git clone --recursive  --depth 1 https://github.com/tulanthoar/prezto /tmp/prez'\
 'wget -O /tmp/ptarch.tar.gz https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.4/pt_linux_amd64.tar.gz'\
 'tar -xzf /tmp/ptarch.tar.gz' 'mv ./ptarch/pt /usr/local/bin/pt'\
 'ln -s /usr/local/bin/pt /usr/local/bin/ag'\
 'for f in zlogin zlogout zpreztorc zprofile zshenv'\
 'do mv /tmp/prez/runcoms/${f} ${HOME}/.${f}'\
 'done'\
 'perl -ne </tmp/prez/runcoms/zshrc "print unless /(infocmp|bind_keys|local|echo)/">$HOME/.zshrc'\
 'mkdir -p $HOME/.zprezto' 'mkdir $HOME/.zprezto/runcoms' 'mkdir $HOME/.zprezto/modules'\
 'zrcsave () { mv "/tmp/prez/runcoms/${1}" "$HOME/.zprezto/runcoms"; }'\
 'zmodsave () { mv "/tmp/prez/modules/${1}" "$HOME/.zprezto/modules"; }'\
 'zsave () { mv "/tmp/prez/${1}" "$HOME/.zprezto/${1}"; }'\
 'printf "%s\n" "zinit.zsh" "alias-tips" "tmux-ohmnivim" "zsh-autosuggestions" "zsh-completion-generator" |xargs -n1 zsave'\
 'for d in "environment" "helper" "spectrum" "utility" "editor" "pacman" "prompt" "history-substring-search";'\
 'do zmodsave $d'\
 'done'\
 'zrcsave myaliases.zsh' 'echo "unalias grep" >> $HOME/.zprezto/runcoms/myaliases.zsh' 'zrcsave myfunctions.zsh'\
 'echo "unalias rm">>$HOME/.zprezto/runcoms/myaliases.zsh'\
 'echo "unalias nvim">>$HOME/.zprezto/runcoms/myaliases.zsh'\
 'curl -L -o /usr/bin/cpanm https://cpanmin.us'\
 'chmod +x /usr/bin/cpanm'\
 'mv /usr/bin/wget /'\
 'trycpanm () { cpanm $1 || cpanm $1 -n || cpanm $1 --force; }'\
 'trycpanm "Perl::Critic"' 'trycpanm "Perl::Tidy"'\
 'mv /wget /usr/bin'\
 'python3 -m ensurepip'\
 'pip3 install --upgrade vim-vint prospector[with_everything] pip setuptools neovim jedi'\
 'ln -s /usr/bin/python3.5 /usr/bin/python'\
 'mkdir -p /root/.config/nvim/bundle' 'mkdir -p /root/.config/nvim/files/backup'\
 'mkdir /root/.config/nvim/files/info' 'mkdir /root/.config/nvim/files/swap'\
 'mkdir /root/.config/nvim/files/cache' 'mkdir /root/.config/nvim/files/undo'\
 'wget -O /root/.config/nvim/init.vim http://raw.githubusercontent.com/tulanthoar/prezto/master/dotfiles/nvim/init.vim'\
 'git clone --depth 1 http://github.com/VundleVim/Vundle.vim.git /root/.config/nvim/bundle/Vundle.vim'\
 'perl <"/root/.config/nvim/init.vim" -p -e "s/^colorscheme kolor$//" > /tmp/viminit && nvim -u /tmp/viminit +PluginInstall +qall'\
 'echo "install"'\
 'rm -rf /.fzf'\
 'printf>/patterns "^%svim$\n" "" "initex." "java." "diff." "readline." "html." "lua." "python." "help." "markdown." "make." "json." "cmake."\
 "automake." "matlab." "git." "syncolor." "cpp." "texmf." "config." "man." "manual." "conf." "Dockerfile." "godoc." "chaskell."\
 "tex." "vim." "sh." "zsh." "perl." "texinfo." "c." "plaintex." "haskell." "go." "pod." "lhaskell." "gitcommit." "gitconfig." "tags." "master." "syntax."\
 "viminfo." "vimnormal." "basic." "context." "cterm." "dircolors." "dockerf." "dot." "xdefaults.vim"'\
 'ls -1 /usr/share/nvim/runtime/syntax > /targets'\
 #'grep -Ev -f /patterns /targets |xargs -n1 printf "/usr/share/nvim/runtime/syntax/%s\n"| xargs -n1 rm -f'\
 'echo "syntax"'\
 'printf "/usr/lib/perl5/core_perl/auto/Encode/%s\n" "CN" "JP" "KR" "TW" | xargs rm -rf'\
 'echo "encode"'\
# 'for d in $(printf "%s " ".git" "__pycache__" "doc" "test" "t" "tests" "test-files" "test-case");'\
 'for d in $(printf "%s " ".git" "__pycache__" "test" "t" "tests" "test-files" "test-case");'\
 'do find /root -type d -name "$d" | xargs -n1 rm -rf'\
 'find /usr -type d -name "$d" | xargs -n1 rm -rf'\
 'done'\
 'echo "dirs"'\
 'rm -rf /root/.cpanm/work/*'\
 'rm -rf /usr/local/share/man/man3'\
 'for f in $(printf "%s " "png" "rst" "md" "md" "svg" "gif" "txt" "exe");'\
 'do find / -type f -name "*.${f}" -delete'\
 'done'\
 'for f in $(printf "%s " "README" "LICENSE");'\
 'do find / -type f -name "${f}.*" -delete'\
 'done'\
 'find /usr -type f -name "*.pod" -delete'\
 'rm /usr/bin/cpanm -f'\
 'rm -rf /usr/lib/python*/ensurepip'\
 'rm -rf /root/.cache'\
 # 'rm /usr/share/nvim/runtime/doc -rf'\
 'rm /usr/lib/python3.5/idlelib/Icons -rf'\
 'rm /usr/lib/python3.5/idlelib/idle_test -rf'\
 'find /usr/lib/python3.5 -type d -name "__pycache__" -print0|xargs -0n1 rm -rf'\
 'rm /usr/share/nvim/runtime/autoload/phpcomplete.vim'\
 'rm /usr/share/locale -rf'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*arm*'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*386*'\
 'mv /root/.config/nvim/bundle/vim-ctrlspace/bin/*linux* /root/.config/nvim/bundle/vim-ctrlspace/'\
 'rm /root/.config/nvim/bundle/vim-ctrlspace/bin/*amd*'\
 'mv /root/.config/nvim/bundle/vim-ctrlspace/file_engine*linux* /root/.config/nvim/bundle/vim-ctrlspace/bin'\
 'find /usr/share/terminfo/ -type f -print0|perl -0ne "print $ARG.qq(\0) unless /xterm/"|xargs -0n1 rm -f'\
 'apk del --purge perl-dev curl make musl-dev gcc rsync'\
 # 'rm -rf /etc/ssl/certs' 'rm -f /lib/apk/db/installed'\
 'rm -rf /tmp/*'\
 'echo "apk"'\
 && cat /tmp/sourceme && source /tmp/sourceme && rm -f /tmp/sourceme
