#!/bin/bash

while true; do

    inotifywait -e create -r /opt/zephyrnet --exclude 'node_modules/' | while read dir action structure; do
        echo "inotifywait 'create' with arguments: $dir $action $structure"
        sudo node /opt/zephyr/watcher/deploy.js $dir $action $structure
    done

    inotifywait -e modify -r /opt/zephyrnet --exclude 'node_modules/' | while read dir action structure; do
        echo "inotifywait 'modify' with arguments: $dir $action $structure"
    done

    inotifywait -e move -r /opt/zephyrnet --exclude 'node_modules/' | while read dir action structure; do
        echo "inotifywait 'move' with arguments: $dir $action $structure"
    done

    # inotifywait -e delete,DELETE -r /opt/zephyrnet | while read dir action structure; do
    #     echo "inotifywait 'delete' with arguments: $dir $action $structure"
    #     sudo node /opt/zephyr/watcher/deleted.js $dir $action $structure
    # done

done
