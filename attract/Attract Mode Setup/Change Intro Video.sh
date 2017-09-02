clear

echo "Attract Mode Intro Video Updater"
echo
echo
echo "Choose the available intro videos below."
echo
echo "Please type the number of the intro you would like to use."
sleep 2
echo
echo
cd /home/pi/.attract/intro
select file in *.mp4; do
  grep 'something' "$file"
  break
done

user_input=$file

cp "/home/pi/.attract/intro/${user_input}" "/home/pi/.attract/intro/intro.mp4"

echo
echo "New intro video has been assigned."
echo
echo "Upon next reboot, the intro video will be:  ${user_input}"
echo
sleep 5
