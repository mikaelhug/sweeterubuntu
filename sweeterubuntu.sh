

####### UPDATE SYSTEM #######
echo "Updating System!\n\n"
sleep 2
sudo apt update
sudo apt upgrade -y
sudo apt install curl wget -y
####### END UPDATE SYSTEM #######


####### PACKAGE CONFIG #######

# Remove Snaps | because snaps are evil
read -r -p "Remove Snaps becuase they are evil (potentially dangerous)? [y/N] " response
if [ "$response" = "y" ]
then
   sudo rm -rf /var/cache/snapd/
   sudo apt autoremove --purge snapd gnome-software-plugin-snap -y
   rm -rf ~/snap
fi
# -->

# Nextcloud PPA
read -r -p "Add Nextcloud ppa and install? [y/N] " response
if [ "$response" = "y" ]
then
   sudo add-apt-repository ppa:nextcloud-devs/client -y
   sudo apt update
   sudo apt install nextcloud-desktop -y
fi
# -->

# Spotify
read -r -p "Add Spotify repo and install? [y/N] " response
if [ "$response" = "y" ]
then
   curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
   echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
   sudo apt update
   sudo apt install spotify-client -y
fi
# -->

# Install packages
read -r -p "Install Chromium, Thunderbird, LibreOffice etc? [y/N] " response
if [ "$response" = "y" ]
then
sudo apt install chromium-browser thunderbird xul-ext-lightning libreoffice gnome-maps remmina gnome-system-monitor \
   python3-pip git gnome-calculator -y
fi
# -->

# Install ddccontrol gddccontrol ddccontrol-db i2c-tools
read -r -p "Install DDC-control to change external monitor brightness? [y/N] " response
if [ "$response" = "y" ]
then
   sudo apt install ddccontrol gddccontrol ddccontrol-db i2c-tools -y
fi
# -->

# Install gnome-sushi (use space-bar to preview files and folders)
read -r -p "Install gnome-sushi (space to preview)? [y/N] " response
if [ "$response" = "y" ]
then
   sudo apt install gnome-sushi -y
fi
# -->

# Slack
read -r -p "Install Slack? [y/N] " response
if [ "$response" = "y" ]
then
   sudo apt install gconf2 python libappindicator1 libindicator7 -y
   cd ~/Downloads
   wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.16.0-amd64.deb
   sudo dpkg -i slack-desktop-4.16.0-amd64.deb
   rm slack-desktop-4.16.0-amd64.deb
fi
# -->

# VScode
read -r -p "Install Visual Studio Code? [y/N] " response
if [ "$response" = "y" ]
then
   curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
   sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
   sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
   sudo apt update
   sudo apt install code -y
fi

read -r -p "Install VScode settings and extensions? [y/N] " response
if [ "$response" = "y" ]
then
   cd ~/Downloads
   mkdir -p ~/.config/Code/User/
   
   wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/vscode/settings.json
   wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/vscode/keybindings-linux.json
   rm -f ~/.config/Code/User/settings.json
   rm -f ~/.config/Code/User/keybindings.json
   mv settings.json ~/.config/Code/User/settings.json
   mv keybindings-linux.json ~/.config/Code/User/keybindings.json

   code --install-extension ms-python.python
   code --install-extension rafamel.subtle-brackets
   code --install-extension ms-vscode-remote.vscode-remote-extensionpack
   code --install-extension ms-vscode.cpptools
   code --install-extension ms-azuretools.vscode-docker
   code --install-extension cssho.vscode-svgviewer
fi

read -r -p "Install VScode vim extension? [y/N] " response
if [ "$response" = "y" ]
then
   code --install-extension vscodevim.vim
fi

read -r -p "Remap caps lock to escape (for vim users)? [y/N] " response
if [ "$response" = "y" ]
then
   gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
fi
# -->

# Jupyter Lab
read -r -p "Install matplotlib numpy scipy jupyterlab pylint? [y/N] " response
if [ "$response" = "y" ]
then
   /usr/bin/python3 -m pip install -U matplotlib numpy scipy sympy jupyterlab pylint --user
fi
# -->

# Firefox uBlock Origin, https everywhere, privacy badger,floccus, vimium
read -r -p "Install Firefox plugins? [y/N] " response
if [ "$response" = "y" ]
then
   cd ~/.mozilla/firefox/*.default-release/extensions
   wget https://addons.mozilla.org/firefox/downloads/latest/607454/addon-607454-latest.xpi -O uBlock0@raymondhill.net.xpi
   wget https://addons.mozilla.org/firefox/downloads/latest/229918/addon-229918-latest.xpi -O https-everywhere@eff.org.xpi
   wget https://addons.mozilla.org/firefox/downloads/latest/506646/addon-506646-latest.xpi -O jid1-MnnxcxisBPnSXQ@jetpack.xpi
   wget https://addons.mozilla.org/firefox/downloads/latest/707450/addon-707450-latest.xpi -O floccus@handmadeideas.org.xpi
   wget https://addons.mozilla.org/firefox/downloads/latest/808538/addon-808538-latest.xpi -O {d7742d87-e61d-4b78-b8a1-b469842139fa}.xpi
fi
# -->

# Download Chromium web-apps doesnt work. | create with terminal?
# read -r -p "Install Chromium apps? [y/N] " response
# if [ "$response" = "y" ]
# then
#    mkdir -p ~/Apps
#    cd ~/Apps
#    wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/chrome-apps/chrome-ncdkolgolkbieejnpdjkkihfbdmcdpnj-Default.desktop
#    wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/chrome-apps/chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop
#    wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/chrome-apps/chrome-fmpeogjilmkgcolmjmaebdaebincaebh-Default.desktop
#    wget https://raw.githubusercontent.com/mhugen/sweeterconfigs/master/chrome-apps/chrome-nmjkbfkcjpemjeeipomkicbjanjdhbkd-Default.desktop
#    chmod +x chrome-ncdkolgolkbieejnpdjkkihfbdmcdpnj-Default.desktop
#    chmod +x chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop
#    chmod +x chrome-fmpeogjilmkgcolmjmaebdaebincaebh-Default.desktop
#    chmod +x chrome-nmjkbfkcjpemjeeipomkicbjanjdhbkd-Default.desktop
# fi
# -->

# Install Shell extensions
read -r -p "Install shell extensions and enable some? [y/N] " response
if [ "$response" = "y" ]
then
   sudo apt install gnome-shell-extensions -y
   sudo apt install gnome-shell-extension-weather -y 
   
   gsettings set org.gnome.shell.extensions.openweather city '59.3340332,18.0279186004574>Stockholm, Sveriges Landskap, Stockholms län, Svealand, Sverige >-1'
   gsettings set org.gnome.shell.extensions.openweather pressure-unit 'hPa'
   gsettings set org.gnome.shell.extensions.openweather unit 'celsius'
   gsettings set org.gnome.shell.extensions.openweather wind-speed-unit 'm/s'

   gsettings set org.gnome.shell enabled-extensions "['workspace-indicator@gnome-shell-extensions.gcampax.github.com', 'openweather-extension@jenslody.de']"
fi
# -->

####### END PACKAGE CONFIG #######


####### UI CONFIG #######

# Lots of custom Ubuntu features
read -r -p "Use custom Ubuntu features? [y/N] " response
if [ "$response" = "y" ]
then
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
   # -->

   # Enable 10 workspaces by default on all monitors
   gsettings set org.gnome.mutter dynamic-workspaces false
   gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
   gsettings set org.gnome.mutter workspaces-only-on-primary false
   gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
   gsettings set org.gnome.shell.extensions.classic-overrides workspaces-only-on-primary false
   # -->

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
   # -->

   # Tab only active workspace and isolate that workspace
   gsettings set org.gnome.shell.app-switcher current-workspace-only true
   gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
   # -->

   # Change alt+tab to switch window and suber+tab to switch application
   gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
   gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
   gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
   gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
   # -->

   # Some useful keyboard shortcuts
   gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'
   gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>f'
   gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>w'
   gsettings set org.gnome.desktop.wm.keybindings panel-run-dialog "['<Super>r']"
   # -->

   # Dock visuals: dock size 28, 
   gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
   gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
   # -->

   # Use expanded list view
   gsettings set org.gnome.nautilus.list-view use-tree-view true
   # -->

   # Show battery percentage
   gsettings set org.gnome.desktop.interface show-battery-percentage true
   # -->

   # Some date options
   gsettings set org.gnome.desktop.interface clock-show-seconds true
   gsettings set org.gnome.desktop.interface clock-show-date true
   gsettings set org.gnome.desktop.calendar show-weekdate true
   # -->

   # Disable animations
   gsettings set org.gnome.desktop.interface enable-animations false

   # Set favorites
   gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop', 'chromium-browser.desktop', 'thunderbird.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'spotify.desktop', 'slack.desktop']"

   # Disable external search-providers and make search less useless and disable
   # Some privacy stuff
   gsettings set org.gnome.desktop.search-providers disable-external true
   gsettings set org.gnome.nautilus.preferences recursive-search 'never'
   gsettings set org.gnome.desktop.privacy remember-recent-files false
   gsettings set org.gnome.desktop.privacy send-software-usage-stats false
fi
# -->

# Move titlebar buttons to the left
read -r -p "Move titlebar buttons to the left? [y/N] " response
if [ "$response" = "y" ]
then
   gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
fi
# -->

# Make Workspace switcher popup smaller
read -r -p "Make Workspace switcher and panel spacing smaller? [y/N] " response
if [ "$response" = "y" ]
then
   config=/usr/share/gnome-shell/theme/ubuntu.css
   sudo sed -i '/^.workspace-switcher-group/,/}$/ s/padding:.*/padding: 2px; }/g' $config
   sudo sed -i '/^.workspace-switcher/,/}$/ s/spacing:.*/spacing: 6px; }/g' $config
   sudo sed -i '/^.ws-switcher-active-up, .ws-switcher-active-down/,/}$/ s/height:.*/height: 5px;/g' $config
   sudo sed -i '/^.ws-switcher-active-up, .ws-switcher-active-down/,/}$/ s/background-size:.*/background-size: 2px;/g' $config
   sudo sed -i '/^.ws-switcher-active-up, .ws-switcher-active-down/,/}$/ s/border-radius:.*/border-radius: 2px; }/g' $config
   sudo sed -i '/^.ws-switcher-box/,/}$/ s/height:.*/height: 5px;/g' $config
   sudo sed -i '/^.ws-switcher-box/,/}$/ s/border-radius:.*/border-radius: 2px; }/g' $config

   # Remove wide spacing panel icons
   config=/usr/share/gnome-shell/theme/ubuntu.css
   sudo sed -i '/^  #panel .panel-button/,/}$/ s/-natural-hpadding:.*/-natural-hpadding: 4px;/g' $config
   sudo sed -i '/^  #panel .panel-button/,/}$/ s/-minimum-hpadding:.*/-minimum-hpadding: 4px;/g' $config
fi
# -->

####### END UI CONFIG #######


####### CONFIGs #######

# Remove music, pictures, videos from Nautilus bookmarks
# Unable to remove trash, recent 
# Not ideal solution, this removes the connection to the default folder
# For programs like screenshot (pictures)
read -r -p "Remove music, pictures, videos from Nautilus bookmarks? [y/N] " response
if [ "$response" = "y" ]
then
   sed -i 's/^\(XDG_TEMPLATES_DIR.*\)/#\1/g' ~/.config/user-dirs.dirs
   sed -i 's/^\(XDG_MUSIC_DIR.*\)/#\1/g' ~/.config/user-dirs.dirs
   sed -i 's/^\(XDG_PICTURES_DIR.*\)/#\1/g' ~/.config/user-dirs.dirs
   sed -i 's/^\(XDG_VIDEOS_DIR.*\)/#\1/g' ~/.config/user-dirs.dirs

   sudo sed -i 's/^\(TEMPLATES.*\)/#\1/g' /etc/xdg/user-dirs.defaults
   sudo sed -i 's/^\(MUSIC.*\)/#\1/g' /etc/xdg/user-dirs.defaults
   sudo sed -i 's/^\(PICTURES.*\)/#\1/g' /etc/xdg/user-dirs.defaults
   sudo sed -i 's/^\(VIDEOS.*\)/#\1/g' /etc/xdg/user-dirs.defaults
fi
# -->

# Configure Git
read -r -p "Configure Git name and email? [y/N] " response
if [ "$response" = "y" ]
then
   read -r -p "Enter name for git: " response
   git config --global user.name "$response"
   read -r -p "Enter email for git: " response
   git config --global user.email "$response"
fi
# -->

# Create ssh certificate
read -r -p "Create ssh certificate? [y/N] " response
if [ "$response" = "y" ]
then
   ssh-keygen -f ~/.ssh/id_rsa
fi
# -->

####### END CONFIGs #######

echo "\n\nYou should restart your computer now.\n\n"
