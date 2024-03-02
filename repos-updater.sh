#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Change directory to /opt
cd /opt || exit

# Iterate through each directory in /opt
for dir in */; do
    if [ -d "$dir/.git" ]; then

        cd "$dir" || exit

       
        echo -e "${BLUE}Updating $dir...${NC}"

        git pull --quiet

        if [ $? -eq 0 ]; then
            
            echo -e "${GREEN}Success${NC}"
        else
           
            echo -e "${RED}Failed${NC}"
        fi

        cd ..
    fi
done
