#! /bin/bash

# generating file name
RND=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-8} | head -n 1)
DATE=$(date +%Y-%m-%d_%H-%M)
FILE=$DATE"_"$RND".png"

# user configuration
URL="https://your.webserver.domain/${FILE}"
LOCAL="/temporary/local/directory"
REMOTE="/your/webserver/directory"
SSHU="your server username"
SSHH="your.server.ip"

ask=`zenity --list --title="Screenshot Options" --column="0" "Local" "Upload" --width=75 --height=75 --hide-header`

if [ "$ask" == "Local" ]; then
    flameshot gui
fi

if [ "$ask" == "Upload" ]; then

    # taking screenshot, seding to remote server, deleting local file
    flameshot gui -r > $LOCAL/$FILE
    scp -i ~/.ssh/artic $LOCAL/$FILE $SSHU@$SSHH:$REMOTE
    rm -r $LOCAL/$FILE
    echo $URL | xclip -selection clipboard
fi
exit 0
