
# flameshot-launch-script
This is just a lil script I made to launch flameshot and add some functionality to it.

The script launches a small GUI to choose from taking a local screenshot (save to clipboard, save to file, ecc.) or use the upload functionality.
## Configuration and Deployment

open the script in a text editor end change these variables to match your server and local pc

```bash
  ...
  # user configuration
  URL="https://your.webserver.domain/${FILE}"
  LOCAL="/temporary/local/directory"
  REMOTE="/your/webserver/directory"
  SSHU="your server username"
  SSHH="your.server.ip"
  ...
```
once you're done configuring the script, save it and make it exectuable

```bash
  chmod +x flame-launch.sh
```
## Further integration into a DE or WM

I personally use i3wm so I bound this script to a shortcut


```bash
  bindsym $mod+Shift+Delete exec /home/<user>/.config/scripts/flame-launch.sh
```
    
