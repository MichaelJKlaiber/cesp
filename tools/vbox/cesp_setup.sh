# Installation of ubuntu packages
sudo apt-get install -y autocutsel default-jre scite evince bless gimp python3 emacs

export CESPRC=/home/$USER/cesp.bashrc

echo '' > $CESPRC

# RISC V GCC
sudo mkdir -p /opt/riscv32
sudo cp -r files/riscv32 /opt/riscv32
echo 'PATH=$PATH:/opt/riscv32/bin/' >> $CESPRC


# Add Rars
sudo mkdir -p /opt/rars
sudo cp files/rars.jar /opt/rars
echo 'alias rars="java -jar /opt/rars/rars.jar"' >> $CESPRC

#Add Ripes
mkdir -p /opt/ripes
sudo cp files/Ripes.AppImage /opt/ripes
echo 'export APPIMAGE_EXTRACT_AND_RUN=1' >> $CESPRC
echo 'alias ripes="/opt/ripes/Ripes.AppImage"' >> $CESPRC


#Add Fpgrars
sudo mkdir -p /opt/fpgrars
sudo cp files/fpgrars /opt/fpgrars
echo 'alias fpgrars="/opt/fpgrars/fpgrars"' >> $CESPRC

#Add cesp_utest
echo 'alias cesp_utest="python3 /opt/cesp_utest/cesp_utest.py"' >> $CESPRC
echo 'alias write_utest="python3 /opt/cesp_utest/write_utest.py"' >> $CESPRC

sudo chmod -R 755 /opt/
