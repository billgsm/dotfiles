| Old | Modern | Description |
|-----|--------|-------------|
| ps | procs | |
| ls | exa | |
| sed | sd | |
| du | dust | |
| find | fd | |
| grep | ag, rg, ack | |
| | tokei | code statistics |
| | hyperfine | benchmarking tool |
| top | ytop | system monitor |
| | grex | regex generator |


```
❯ brew list
==> Formulae
ack                     diff-so-fancy           gnutls                  kubectx                 libtasn1                mongodb-database-tools  pcre2                   telnet
adr-tools               docbook                 go                      kubernetes-cli          libtermkey              mongosh                 pdfgrep                 tfenv
aom                     docbook-xsl             goaccess                lazydocker              libtiff                 mpdecimal               perl                    the_silver_searcher
apr                     docker-slim             gobject-introspection   lazygit                 libtool                 msgpack                 php                     tidy-html5
apr-util                double-conversion       graphite2               libb2                   libunistring            mtr                     pixman                  tig
argon2                  dust                    graphviz                libde265                libuv                   navi                    pkg-config              tldr
aspell                  fd                      grep                    libev                   libvmaf                 ncurses                 plow                    tmux
assimp                  figlet                  grex                    libevent                libvterm                neovim                  poppler                 tokyo-cabinet
autoconf                fontconfig              gts                     libffi                  libx11                  netpbm                  powerlevel10k           tree
automake                fortune                 guile                   libgcrypt               libxau                  nettle                  python@2                tree-sitter
awscli                  freetds                 harfbuzz                libgpg-error            libxcb                  nghttp2                 python@3.10             unbound
bash                    freetype                hexyl                   libheif                 libxdmcp                ngrep                   python@3.8              unibilium
bash-completion         fribidi                 html2text               libidn                  libxext                 node                    python@3.9              universal-ctags
bat                     fzf                     htop                    libidn2                 libxrender              node@14                 qt                      unixodbc
bdw-gc                  gd                      httpie                  libksba                 libyaml                 noti                    qt@5                    utf8proc
berkeley-db             gdbm                    hub                     liblqr                  libzip                  nspr                    ranger                  vim
bpytop                  gdk-pixbuf              hunspell                libmaxminddb            little-cms2             nss                     readline                watch
brotli                  gettext                 icu4c                   libmetalink             lsd                     nvm                     ripgrep                 webp
c-ares                  gh                      ilmbase                 libnghttp2              lua                     oniguruma               rtmpdump                wtfutil
ca-certificates         ghostscript             imagemagick             libomp                  lua@5.1                 openexr                 ruby                    x265
cairo                   giflib                  imath                   libpng                  luajit                  openjpeg                screen                  xmlto
ccat                    git                     jansson                 libpq                   luajit-openresty        openldap                shared-mime-info        xorgproto
charm                   git-delta               jasper                  libproxy                luv                     openssl@1.1             shellcheck              xsv
coreutils               git-flow-avh            jbig2dec                libpthread-stubs        lynx                    osx-cpu-temp            siege                   xz
cowsay                  glab                    jemalloc                librsvg                 lzo                     p11-kit                 six                     yank
cscope                  glib                    jpeg                    libsmi                  m4                      packer                  spark                   yq
curl                    glow                    jpeg-xl                 libsodium               macos-term-size         pango                   sqlite                  zlib
curl-openssl            gmp                     jq                      libssh                  md4c                    parallel                task                    zsh
dbus                    gnu-getopt              krb5                    libssh2                 mongodb-community       pcre                    tcl-tk                  zstd

==> Casks
evernote                font-hack-nerd-font     http-toolkit            spectacle               tableplus               xmind                   xquartz                                                 /2,3463s
```

```
> brew leaves --installed-on-request

ack
adr-tools
automake
awscli
bash
bash-completion
bat
bpytop
ccat
charmbracelet/tap/charm
coreutils
cowsay
diff-so-fancy
docker-slim
dust
fd
figlet
fortune
gh
git
git-delta
git-flow-avh
glab
glow
go
goaccess
graphviz
grep
grex
hexyl
html2text
htop
httpie
hub
imagemagick
jesseduffield/lazygit/lazygit
jq
kubectx
libksba
lsd
luajit
lynx
mongodb/brew/mongodb-community
mtr
navi
neovim
ngrep
node
noti
nvm
packer
parallel
pdfgrep
php
plow
python@2
ranger
ripgrep
romkatv/powerlevel10k/powerlevel10k
screen
shellcheck
siege
spark
task
telnet
tfenv
the_silver_searcher
tig
tldr
tmux
tree
universal-ctags/universal-ctags/universal-ctags
vim
watch
wtfutil
xsv
yank
yq
zlib
zsh-autosuggestions
zsh-syntax-highlighting
```


> xargs brew install < brew-packages.txt
