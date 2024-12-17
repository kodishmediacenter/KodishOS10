#!/usr/bin/env bash
                        
 loadkeys br-abnt2
 pacman -S curl
 curl -sL https://raw.githubusercontent.com/picodotdev/alis/main/download.sh | bash
 vim alis.conf           
 ./alis.sh              
