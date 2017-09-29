#!/usr/bin/env bash

## This file is NOT part of The RetroPie Project
#
# This script is a third party script to install Attract Mode themes
# onto a RetroPie build.
#
# Theme creators will upload their Attract Mode themes to Github and
# this install script will contain the links to them.
#
# The main Attract Mode Theme installer script will contain the links
# to the various creators Github pages for inclusion.  End users will
# then be able to easily download new themes for use.
##

localver=1.0.1b
currentuser=$(who | awk {'print $1'} | head -n1)
updatever=$(curl https://raw.githubusercontent.com/hyperpie/AM_Config_Display/master/attract/Attract%20Mode%20Setup/themes_version.txt 2> /dev/null)

function check_for_script_update() {
if [ $updatever != $localver ]; then
echo "You have Version $localver. The latest version is $updatever Please Update on the next menu!"
sleep 10
fi
}


function depends_amthemes() {
    if isPlatform "x11"; then
        getDepends feh
    else
        getDepends fbi
    fi
}

function install_theme_amthemes() {
    local theme="$1"
    local repo="$2"
    if [[ -z "$repo" ]]; then
        repo="default"
    fi
    if [[ -z "$theme" ]]; then
        theme="default"
        repo="default"
    fi
    rm -rf "/home/$currentuser/.attract/layouts/$theme"
    mkdir -p "/home/$currentuser/.attract/layouts"
    git clone "https://github.com/$repo/am-theme-$theme.git" "/home/$currentuser/.attract/layouts/$theme"
}

function uninstall_theme_amthemes() {
    local theme="$1"
    if [[ -d "/home/$currentuser/.attract/layouts/$theme" ]]; then
        rm -rf "/home/$currentuser/.attract/layouts/$theme"
    fi
}

function gui_amthemes() {
    local themes=(
        'dmmarti robospin'
        'dmmarti hurstyblue_system'
        'dmmarti hurstyblue_main'
        'dmmarti hurstyblue_nds'
        'RetroHursty69 comiccrazy'
        'RetroHursty69 unifiedsnazzy'
        'calle81 HPSilkyGamesMenu'
        'calle81 HPSilkySubMenu'
        'calle81 HPSilkyMainMenu'
        'calle81 HP2Beta'
    )
    while true; do
        local theme
        local installed_themes=()
        local repo
        local options=()
        local status=()
        local default

        options+=(U "Update install script - script will exit when updated")

        local i=1
        for theme in "${themes[@]}"; do
            theme=($theme)
            repo="${theme[0]}"
            theme="${theme[1]}"
            if [[ -d "/home/$currentuser/.attract/layouts/$theme" ]]; then
                status+=("i")
                options+=("$i" "Update or Uninstall $theme (installed)")
                installed_themes+=("$theme $repo")
            else
                status+=("n")
                options+=("$i" "Install $theme (not installed)")
            fi
            ((i++))
        done
        local cmd=(dialog --default-item "$default" --backtitle "$__backtitle" --menu "Attract Mode Theme Installer - Choose an option (Beta 1.0)" 22 76 16)
        local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        default="$choice"
        [[ -z "$choice" ]] && break
        case "$choice" in
            U)  #update install script to get new theme listings
                cd "/home/$currentuser/.attract/Attract Mode Setup" 
                cp "Themes.sh" "Themes.sh.bkp"
                rm -rf Themes.sh 
                wget "https://raw.githubusercontent.com/hyperpie/AM_Config_Display/master/attract/Attract Mode Setup/Themes.sh" -O "/home/$currentuser/.attract/Attract Mode Setup/Themes.sh"
                chmod 777 "Themes.sh" 
                exec "$0"
                ;;
            *)  #install or update themes
                theme=(${themes[choice-1]})
                repo="${theme[0]}"
                theme="${theme[1]}"
                if [[ "${status[choice]}" == "i" ]]; then
                    options=(1 "Update $theme" 2 "Uninstall $theme")
                    cmd=(dialog --backtitle "$__backtitle" --menu "Choose an option for theme" 12 40 06)
                    local choice=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
                    case "$choice" in
                        1)
                            install_theme_amthemes "$theme" "$repo"
                            ;;
                        2)
                            uninstall_theme_amthemes "$theme"
                            ;;
                    esac
                else
                    install_theme_amthemes "$theme" "$repo"
                fi
                ;;
        esac
    done
}
check_for_script_update
gui_amthemes
