clear

echo "Updating Attract Mode to the latest version....."
echo
sleep 5
echo

#updating sfml-pi
echo "Updating SFML-PI....."
echo
sleep 5

cd ~
git clone --depth 1 https://github.com/mickelson/sfml-pi sfml-pi
mkdir sfml-pi/build;cd sfml-pi/build
cmake .. -DSFML_RPI=1 -DEGL_INCLUDE_DIR=/opt/vc/include -DEGL_LIBRARY=/opt/vc/lib/libEGL.so -DGLES_INCLUDE_DIR=/opt/vc/include -DGLES_LIBRARY=/opt/vc/lib/libGLESv1_CM.so
sudo make install
sudo ldconfig
rm -r -f sfml-pi

#updating mmal
echo "Updating MMAL....."
echo
sleep 5

cd ~
rm -r -f ffmpeg
git clone git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
./configure --enable-mmal --disable-debug --enable-shared
sudo make install
echo "include /usr/local/lib/" |sudo tee --append /etc/ld.so.conf > /dev/null
sudo ldconfig
cd ~
rm -r -f ffmpeg

#updating attract mode
echo "Updating Attract Mode....."
echo
sleep 5

cd ~
rm -r -f develop
mkdir develop
cd develop
git clone --depth 1 https://github.com/mickelson/attract
cd attract
make USE_GLES=1
sudo make install
cd ~
rm -r -f develop

echo
echo "Finished updating Attract Mode ..... about to reboot."
echo
sleep 5

sudo reboot now

