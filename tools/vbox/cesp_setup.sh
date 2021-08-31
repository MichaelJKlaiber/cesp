# Prerequisite


# Installation of ubuntu packages
sudo apt-get install -y default-jre scite evince bless gimp python3 emacs

export CESPREPO=/home/$USER/cesp_course
export TOOLS=$CESPREPO/tools
export CESPRC=/home/$USER/cesp.bashrc

echo '' > $CESPRC

# RISC V GCC
echo "PATH=$PATH:$TOOLS/riscv32/bin/" >> $CESPRC


# Add Rars
echo "alias rars=\"java -jar $TOOLS/rars/rars.jar\"" >> $CESPRC

#Add Ripes
echo "export APPIMAGE_EXTRACT_AND_RUN=1" >> $CESPRC
echo "alias ripes=\"$TOOLS/ripes/ripes.AppImage\" >> $CESPRC


#Add Fpgrars
echo "alias fpgrars=\"$TOOLS/fpgrars/fpgrars\"" >> $CESPRC

#Add cesp_utest
echo "alias cesp_utest=\"python3 $TOOLS/cesp_utest/cesp_utest.py\"" >> $CESPRC
echo "alias write_utest=\"python3 $TOOLS/cesp_utest/write_utest.py\"" >> $CESPRC

source $CESPRC
echo "source $CESPRC" >> /home/$USER/.bashrc
