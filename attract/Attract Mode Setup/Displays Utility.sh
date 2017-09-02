cd /home/pi/.attract
rm attract_tmp.cfg
rm temp.cfg
cp attract.cfg attract.cfg.bkp
clear
echo

echo
echo "Motion Blue Attract Mode Displays Utility"
echo
echo "This script will allow you to quickly show or hide the various mame/fba Classics displays"
echo "and the various game Collections displays." 
echo
echo "After executing the script, you will need to restart Attract Mode for the changes to take affect."
echo
echo "Please select your choice below."
echo
echo "1. hide all Classics displays"
echo "2. show all Classics displays"
echo "3. hide all Collections displays"
echo "4. show all Collections displays"
echo
echo "99. exit"
echo
read -p "Enter the number and press <enter> : " useranswer

cp attract.cfg attract_tmp.cfg

if [[ $useranswer == "1" ]]; then
isclassic="false"
while read line
do
if [[ $line == "display"*"Classic"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="true"
elif [[ $line == "display"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="false"
elif [[ $line == *"in_cycle"* && $isclassic = "true" ]]; then
  echo -e "\tin_cycle             no" >> temp.cfg
elif [[ $line == *"in_menu"* && $isclassic = "true" ]]; then
  echo -e "\tin_menu              no" >> temp.cfg
  isclassic="false"
elif [[ $line == "rule"* ]]; then
  echo -e "\t\t${line}" >> temp.cfg
elif [[ $line == "sound" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "input_map" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "general" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "saver_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "layout_config"* ]]; then
  echo $line >> temp.cfg
elif [[ $line == "intro_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "#"* ]]; then
  echo $line >> temp.cfg
else
  echo -e "\t${line}" >> temp.cfg
fi
done < attract_tmp.cfg
fi

if [[ $useranswer == "2" ]]; then
isclassic="false"
while read line
do
if [[ $line == "display"*"Classic"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="true"
elif [[ $line == "display"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="false"
elif [[ $line == *"in_cycle"* && $isclassic = "true" ]]; then
  echo -e "\tin_cycle             yes" >> temp.cfg
elif [[ $line == *"in_menu"* && $isclassic = "true" ]]; then
  echo -e "\tin_menu              yes" >> temp.cfg
  isclassic="false"
elif [[ $line == "rule"* ]]; then
  echo -e "\t\t${line}" >> temp.cfg
elif [[ $line == "sound" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "input_map" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "general" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "saver_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "layout_config"* ]]; then
  echo $line >> temp.cfg
elif [[ $line == "intro_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "#"* ]]; then
  echo $line >> temp.cfg
else
  echo -e "\t${line}" >> temp.cfg
fi
done < attract_tmp.cfg
fi

if [[ $useranswer == "3" ]]; then
isclassic="false"
while read line
do
if [[ $line == "display"*"Collection"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="true"
elif [[ $line == "display"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="false"
elif [[ $line == *"in_cycle"* && $isclassic = "true" ]]; then
  echo -e "\tin_cycle             no" >> temp.cfg
elif [[ $line == *"in_menu"* && $isclassic = "true" ]]; then
  echo -e "\tin_menu              no" >> temp.cfg
  isclassic="false"
elif [[ $line == "rule"* ]]; then
  echo -e "\t\t${line}" >> temp.cfg
elif [[ $line == "sound" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "input_map" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "general" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "saver_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "layout_config"* ]]; then
  echo $line >> temp.cfg
elif [[ $line == "intro_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "#"* ]]; then
  echo $line >> temp.cfg
else
  echo -e "\t${line}" >> temp.cfg
fi
done < attract_tmp.cfg
fi

if [[ $useranswer == "4" ]]; then
isclassic="false"
while read line
do
if [[ $line == "display"*"Collection"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="true"
elif [[ $line == "display"* && $line != "displays_menu_exit"* ]]; then
  echo $line >> temp.cfg
  isclassic="false"
elif [[ $line == *"in_cycle"* && $isclassic = "true" ]]; then
  echo -e "\tin_cycle             yes" >> temp.cfg
elif [[ $line == *"in_menu"* && $isclassic = "true" ]]; then
  echo -e "\tin_menu              yes" >> temp.cfg
  isclassic="false"
elif [[ $line == "rule"* ]]; then
  echo -e "\t\t${line}" >> temp.cfg
elif [[ $line == "sound" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "input_map" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "general" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "saver_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "layout_config"* ]]; then
  echo $line >> temp.cfg
elif [[ $line == "intro_config" ]]; then
  echo $line >> temp.cfg
elif [[ $line == "#"* ]]; then
  echo $line >> temp.cfg
else
  echo -e "\t${line}" >> temp.cfg
fi
done < attract_tmp.cfg
fi

rm attract_tmp.cfg
cp temp.cfg attract.cfg

echo
echo "Script has finished."
echo
echo "You will need to restart Attract Mode for the changes to take affect."
echo
sleep 10

