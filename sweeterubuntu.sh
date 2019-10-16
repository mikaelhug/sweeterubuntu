
# Disable super+{1,2,3,..} to launch apps
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []
gsettings set org.gnome.shell.keybindings switch-to-application-6 []
gsettings set org.gnome.shell.keybindings switch-to-application-7 []
gsettings set org.gnome.shell.keybindings switch-to-application-8 []
gsettings set org.gnome.shell.keybindings switch-to-application-9 []

Enable super+nr to switch workspace


Disable Workspace switcher popup
sudo nano /usr/share/gnome-shell/theme/ubuntu.css
########### BYT #################
/* Workspace Switcher */
.workspace-switcher-group {
  padding: 2px; }

.workspace-switcher {
  background: transparent;
  border: 0px;
  border-radius: 0px;
  padding: 0px;
  spacing: 6px; }

.ws-switcher-active-up, .ws-switcher-active-down {
  height: 5px;
  background-color: #dd4814;
  color: #ffffff;
  background-size: 2px;
  border-radius: 2px; }

.ws-switcher-box {
  height: 5px;
  border: 1px solid rgba(238, 238, 236, 0.1);
  background: transparent;
  border-radius: 2px; }
#####################################

Remove Snaps
sudo apt autoremove --purge snapd gnome-software-plugin-snap 
