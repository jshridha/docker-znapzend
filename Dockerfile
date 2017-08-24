FROM oblique/archlinux-pacaur

ENV znapzendVersion=0.17.0

RUN pacman -S --noconfirm base-devel openssh wget && \

    sudo -u aur pacaur --noconfirm --noedit -S zfs-linux mbuffer && \
    
    wget https://github.com/oetiker/znapzend/releases/download/v$znapzendVersion/znapzend-$znapzendVersion.tar.gz && \
    tar zxvf znapzend-$znapzendVersion.tar.gz && \
    cd znapzend-$znapzendVersion && \
    ./configure --prefix=/opt/znapzend-$znapzendVersion && \
    make && make install && \
    for x in /opt/znapzend-$znapzendVersion/bin/*; do ln -s $x /usr/local/bin; done && \
    pacman -Qtdq | xargs -r pacman --noconfirm -Rcns && \
    yes | pacman -Scc && \
    rm -rf /home/aur/.cache/pacaur

