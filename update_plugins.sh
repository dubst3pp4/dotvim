#!/bin/bash
which git >/dev/null || {
    echo "git not found in path..."
    exit 1
}

for BASE_DIR in "${HOME}/.vim"; do
    PLUGIN_DIR="${BASE_DIR}/pack/plugins/start"
    echo $PLUGIN_DIR
    if [[ -d "${PLUGIN_DIR}" ]]; then
        echo "Updating plugins in ${PLUGIN_DIR}..."
        for plugin in "${PLUGIN_DIR}/"*; do
            if [[ -e "${plugin}/.git" ]]; then
                echo "plugin: ${plugin}..."
                cd "${plugin}"
                git submodule update --init --recursive && git checkout master && git pull
            fi
        done
    fi
done
