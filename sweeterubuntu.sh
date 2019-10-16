
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

# Tab only active workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Change alt+tab to switch window and suber+tab to switch application
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"

# Some useful keyboard shortcuts
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '<Super>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>f'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '<Super>w'

# Dock size 28
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28

# Move titlebar buttons to the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Some date options
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.calendar show-weekdate true

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false

# Install some extensions
sudo apt install gnome-shell-extension-weather gnome-shell-extensions -y

# Enable extensions
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

# Remove Snaps
# sudo apt autoremove --purge snapd gnome-software-plugin-snap 
