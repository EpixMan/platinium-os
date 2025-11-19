#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#Niri stuff:
sudo dnf copr enable avengemedia/dms -y
sudo dnf install niri dms -y
systemctl enable --now dsearch
systemctl  add-wants niri.service dms


rpm-ostree install podman-compose fastfetch helix bpytop git-credential-libsecret polkit lxpolkit xdg-user-dirs dbus-tools dbus-daemon gnome-keyring pavucontrol google-noto-emoji-fonts gnome-disk-utility gparted wireplumber pipewire pamixer network-manager-applet NetworkManager-openvpn NetworkManager-openconnect pipewire-alsa wlr-randr wlsunset brightnessctl foot fish fontawesome-fonts-all gnome-themes-extra gnome-icon-theme paper-icon-theme breeze-icon-theme papirus-icon-theme kvantum adw-gtk3-theme ffmpeg gstreamer1-vaapi gstreamer1-plugins-bad-free-extras gstreamer1-plugin-libav -y

#flatpak install -y --system app.zen_browser.zen com.discordapp.DiscordCanary com.github.tchx84.Flatseal com.obsproject.Studio com.ranfdev.DistroShelf com.super_productivity.SuperProductivity dev.zed.Zed io.dbeaver.DBeaverCommunity io.dbeaver.DBeaverCommunity.Client.pgsql io.github.Qalculate md.obsidian.Obsidian net.ankiweb.Anki org.chromium.Chromium org.ferdium.Ferdium org.kde.filelight org.kde.gwenview org.kde.krita org.kde.krita.Codecs org.onlyoffice.desktopeditors org.telegram.desktop org.videolan.VLC us.zoom.Zoom
#### Example for enabling a System Unit File

systemctl enable podman.socket
