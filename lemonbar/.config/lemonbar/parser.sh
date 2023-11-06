#!/bin/bash

cd $(dirname -- $0)

. ./common.sh

desktop="$(bspc_desktops)"

while read -r line; do
    case $line in
        DAT*)
            date="%{B${color_hl1}}   ${line#???}   %{B-}"
            ;;
        DES*)
            desktop="${line#???}"
            ;;
        BRI*)
            brightness="\uf0eb ${line#???}"
            ;;
        VOL*)
            volume="${line#???}"
            ;;
        BAT*)
            battery="\uf578${line#???}"
            ;;
        *) ;;
    esac

    echo -e "%{l}${date}${desktop}%{r}${brightness}   ${volume}   ${battery}    "
done
