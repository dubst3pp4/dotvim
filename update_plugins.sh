#!/bin/bash
which git >/dev/null || {
    echo "git not found in path..."
    exit 1
}

for BASE_DIR in "${HOME}/.vim"; do
    for DIR in "${BASE_DIR}/pack/"*; do
        PLUGIN_DIR="${DIR}/start"
        echo $PLUGIN_DIR
        if [[ -d "${PLUGIN_DIR}" ]]; then
            echo "Updating plugins in ${PLUGIN_DIR}..."
            for plugin in "${PLUGIN_DIR}/"*; do
                if [[ -e "${plugin}/.git" ]]; then
                    echo "plugin: ${plugin}..."
                    cd "${plugin}"
                    git submodule update --init --recursive && git checkout && git pull
                    if [[ -e "${plugin}/doc" ]]; then
                        vim --cmd "helptags ${plugin}/doc" --cmd "q"
                    fi
                fi
            done
        fi
    done
done
