#! /bin/bash
echo -e "written by MEGUENNI khelil\n03/16/2018"
echo openSmile Instalation...
result=`pwd`
echo -e "instalation directory is $result\n"


#installing requirements
sudo apt-get install build-essential libtool m4 automake libasound-dev

#-------------------------------------------------------------------------

#installing PortAudio
echo "portAudio will be installed in : $result"
#downloading PortAudio
wget http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz &&
tar -zvxf pa_stable_v19_20140130.tgz
cd portaudio
./configure && make
sudo make install
cd ..
#-------------------------------------------------------------------------

#downloading openSmile 
wget  http://www.audeering.com/research-and-open-source/files/openSMILE-2.1.0.tar.gz &&
#extracting openSmile
tar -zxvf openSMILE-2.1.0.tar.gz
cd ../openSMILE-2.1.0
bash autogen.sh
./configure
sh buildWithInstalledPortAudio.sh
./SMILExtract -h
cd $result

