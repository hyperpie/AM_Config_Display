cd /home/pi/.attract/romlists
rm /home/pi/.attract/romlists/*.tag
mv /home/pi/.attract/romlists/Favorites.txt Favorites.back
touch Favorites.txt
clear
echo    
echo
echo "Motion Blue Remove All Favorites Script"
echo
echo "Script has finished running.  There are no games currently tagged as a favorite"
echo "and the Favorites.txt romlist file is now empty."
echo
echo
echo "Browse the different systems and tag games as a favorite and run the Generate Favorites"
echo "script located in the Attract Mode Setup display."
echo
echo "After running the Generate Favorites script, your favorite games will appear in the Favorites display."
echo
sleep 10
