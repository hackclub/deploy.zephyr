#!/bin/bash

while true; do

    inotifywait -e create -r /opt/zephyrnet | while read dir action structure; do
        echo "inotifywait 'create' with arguments: $dir $action $structure"
        sudo node /opt/zephyr/watcher/deploy.js $dir $action $structure
    done

done
