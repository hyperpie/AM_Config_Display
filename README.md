## AM_Config_Display

-------
OVERVIEW

(note, web browsers will mess up the syntax of this document, but it will be right when downloaded and reading the README.md file)

This ZIP package is intended to be used with a Raspberry Pi RetroPie/Attract Mode build.

The included shell scripts are setup for use with RetroPie only.

For users who are using Attract Mode as their front-end, this ZIP package contains a display called Attract Mode Setup.  This display is equivalent to the RetroPie menu within Emulation Station.

This display is used for general configuration of Attract Mode as well as providing almost all of the same options as the Emulation Station RetroPie menu.

------------
INSTALLATION

Once the ZIP package is downloaded and extracted, copy all of the included files and folder to their equivalent folder on RetroPie. 

NOTE: the /home/pi/.attract folder is a hidden folder so you may have to enable show hidden files in your SFTP program.

The included ZIP file contains a folder called attract.  This folder is equivelent to /home/pi/.attract.  Navigate to that folder on the Pi and then transfer the files and folders into it.

You should end up with a directory structure like this. 

/home/pi/.attract/Attract Mode Setup
/home/pi/.attract/emulators   - this folder should have already existed
/home/pi/.attract/romlistss   - this folder should have already existed

The included emulator configuration file and romlist file will establish the path locations.

Restart Attract Mode.

After restart, you will possibly need to add the new display.

Press TAB
Choose Displays
Name it:  Attract Mode Setup

Assign the new display a layout to use and also choose the romlist called Attract Mode Setup.

Press ESC/BACK to navigate back to your main menu.

The new display should be visible.

-----
USAGE

Here are the individual scripts and their functions.

Built-in RetroPie scripts

Configure Wifi - setup wifi connection
Show IP Address - show current IP address
Raspberry Pi Setup - launch raspi_config
RetroPie Setup - launch retropie_setup
Audio Settings - launch the audio setup
Bluetooth - launch the bluetooth setup
Change Splash Screen - change bootup splash screen
Configuration Editor - launch the configuration editor
File Manager Setup - launch the file manager
Run Command - launch the run command configuration
Retroarch - launch the retroarch configuration
Reboot - reboot Pi
Shutdown - shutdown Pi

Additional added scripts

Change Intro Video - change intro MP4 
                     copy MP4 files to /home/pi/.attract/intro
Displays Utility - quickly show or hide certain displays
                   Classics displays for mame/fba breakout
                   Collection displays for various collections
Generate Favorites - compile all games tagged as favorite into a single romlist file
                     for use by the display named Favorites
Launch Emulation Station - launch into Emulation Station (requires additional scripts in /opt directory)
Remove All Favorites - delete the Favorites romlist file
Themes - install additional Attract Mode themes
Update Attract Mode - update Attract Mode to latest version

Notes regarding the Themes installer.

The AM Themes installer operates in much the same way as the Emulation Station Themes manager does.  The script provides a listing of available themes for download.  Once selected, the theme will be downloaded into the AM layouts folder.

Periodically, new themes will be added into the AM Themes installer script.  Perform an update on the script to retrieve the latest theme listings.

Once new themes are installed, you will need to manually assign the various displays to use them.

Press TAB
Choose Displays
Choose an individual display
Navigate to the layout option, press <enter> and change to the newly downloaded theme.

Note: new themes will be added when theme authors submit them for inclusion

---------------
To Theme Authors

Anyone wishing to have their Attract Mode theme included needs to follow these guidelines.

1.  upload the theme to Github
2.  name the theme using this syntax
    am-theme-xxxxx     where xxxxx is the theme name
    do not include any spaces or special characters
    - and _ are valid
3.  submit a request for inclusion
    a.  make contact via Github
    b.  make contact via Youtube/Facebook/Forums
    c.  submit a Pull Request into the AM_Config_Display repository

