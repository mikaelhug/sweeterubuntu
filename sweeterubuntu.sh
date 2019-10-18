

####### UPDATE SYSTEM #######
sudo apt update
sudo apt upgrade -y
sudo apt install curl wget -y
####### END UPDATE SYSTEM #######


####### PACKAGE CONFIG #######
# Remove Snaps | because snaps are evil
sudo rm -rf /var/cache/snapd/
sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
rm -rf ~/snap
# -->

# Nextcloud PPA
sudo add-apt-repository ppa:nextcloud-devs/client -y
# -->

# Spotify Repo
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# -->

# Install packages
sudo apt update
sudo apt install nextcloud-client spotify-client chromium-browser thunderbird libreoffice gnome-maps remmina gnome-system-monitor -y
sudo apt install python3-pip git -y
# -->

# Slack
sudo apt install gconf2 python libappindicator1 libindicator7 -y
cd ~/Downloads
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.1.1-amd64.deb
sudo dpkg -i slack-desktop-4.1.1-amd64.deb
rm slack-desktop-4.1.1-amd64.deb
# -->

# VScode
cd ~/Downloads
wget https://az764295.vo.msecnd.net/stable/6ab598523be7a800d7f3eb4d92d7ab9a66069390/code_1.39.2-1571154070_amd64.deb
sudo dpkg -i code_1.39.2-1571154070_amd64.deb
rm code_1.39.2-1571154070_amd64.deb

code --install-extension ms-python.python
code --install-extension vscodevim.vim
code --install-extension rafamel.subtle-brackets
code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension cssho.vscode-svgviewer

wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/vscode/settings.json
wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/vscode/keybindings-linux.json
rm -f ~/.config/Code/User/settings.json
rm -f ~/.config/Code/User/keybindings.json
mv settings.json ~/.config/Code/User/settings.json
mv keybindings-linux.json ~/.config/Code/User/keybindings.json

/usr/bin/python3 -m pip install -U pylint --user
# -->

# Jupyter Lab
/usr/bin/python3 -m pip install -U matplotlib numpy scipy jupyterlab --user

# -->

# Firefox uBlock Origin, https everywhere, privacy badger,floccus, vimium
cd ~/Downloads
wget https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi -O uBlock0@raymondhill.net.xpi
wget https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi -O https-everywhere@eff.org.xpi
wget https://addons.mozilla.org/firefox/downloads/latest/506646/addon-506646-latest.xpi -O jid1-MnnxcxisBPnSXQ@jetpack.xpi
wget https://addons.mozilla.org/firefox/downloads/latest/707450/addon-707450-latest.xpi -O floccus@handmadeideas.org.xpi
wget https://addons.mozilla.org/firefox/downloads/latest/808538/addon-808538-latest.xpi -O {d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
mv uBlock0@raymondhill.net.xpi ~/.mozilla/firefox/*.default-release/extensions/uBlock0@raymondhill.net.xpi
mv https-everywhere@eff.org.xpi ~/.mozilla/firefox/*.default-release/extensions/https-everywhere@eff.org.xpi
mv jid1-MnnxcxisBPnSXQ@jetpack.xpi ~/.mozilla/firefox/*.default-release/extensions/jid1-MnnxcxisBPnSXQ@jetpack.xpi
mv floccus@handmadeideas.org.xpi ~/.mozilla/firefox/*.default-release/extensions/floccus@handmadeideas.org.xpi
mv {d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi ~/.mozilla/firefox/*.default-release/extensions/{d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
# -->

# Create Chromium web-apps

# -->


####### END PACKAGE CONFIG #######


####### UI CONFIG #######
# Disable super+{1,2,3,..} to launch apps
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 []
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 []

# Enable 10 workspaces by default
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

# Enable super+nr to switch workspace | add move to workspace shortcut?
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

# Tab only active workspace and isolate that workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

# Change alt+tab to switch window and suber+tab to switch application
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"

# Some useful keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>f'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>w'
gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>r']"

# Dock visuals: dock size 28, 
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'

# Move titlebar buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Use expanded list view
gsettings set org.gnome.nautilus.list-view use-tree-view true

# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Some date options
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.calendar show-weekdate true

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false

# Install some extensions | poor with apt. Zip?
# sudo apt install gnome-shell-extension-weather gnome-shell-extensions -y

# Enable extensions | save as variable and extend with new
# gsettings get org.gnome.shell enabled-extensions
# gsettings set org.gnome.shell enabled-extensions "['workspace-indicator@gnome-shell-extensions.gcampax.github.com']"


# Disable Workspace switcher popup
# sudo nano /usr/share/gnome-shell/theme/ubuntu.css
# ########### BYT #################
# /* Workspace Switcher */
# .workspace-switcher-group {
#   padding: 2px; }

# .workspace-switcher {
#   background: transparent; Bookmark 
#   border: 0px;
#   border-radius: 0px;
#   padding: 0px;
#   spacing: 6px; }

# .ws-switcher-active-up, .ws-switcher-active-down {
#   height: 5px;
#   background-color: #dd4814;
#   color: #ffffff;
#   background-size: 2px;
#   border-radius: 2px; }

# .ws-switcher-box {
#   height: 5px;
#   border: 1px solid rgba(238, 238, 236, 0.1);
#   background: transparent;
#   border-radius: 2px; }
# #####################################

# /usr/share/gnome-shell/theme/gnome-shell.css
#panel .panel-button {
# -natural-hpadding: 4px;
# -minimum-hpadding: 4px;


####### END UI CONFIG #######
