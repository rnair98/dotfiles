#!/bin/bash

# Clean package cache
sudo pacman -Scc

# Remove unused packages (orphans)
sudo pacman -Rs $(pacman -Qtdq)

# clean the cache in /home directory

