FROM oblique/archlinux-pacaur

ENV znapzendVersion=0.17.0

RUN sudo -u aur pacaur --noconfirm --noedit -S zfs-linux mbuffer
RUN sudo -u aur pacaur --noconfirm --noedit -S znapzend
RUN pacman -S --noconfirm base-devel openssh wget
