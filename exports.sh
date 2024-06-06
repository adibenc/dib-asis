#exports
#flutter & go
# :/media/data1/bins/4linux/jre-8u311-linux-x64/jre1.8.0_311/bin\
export PATH="$PATH:/media/data3/flutter/bin\
:/usr/local/go/bin:/usr/bin/bin/:/media/data3/projects/tunnelroot\
:/media/data1/bins/4linux/node-v20.11.0-linux-x64/bin\
:/opt/lampp/bin:$GOPATH:$GOPATH/bin:$GOPATH/go/bin\
:/usr/local/android-studio/bin\
:/media/data2/links/Android/Sdk/cmdline-tools/bin\
:/media/data2/links/Android/Sdk/cmdline-tools/latest/bin\
:/usr/bin/flutter/bin"
# :/media/data1/bins/4linux/node-v18.15.0-linux-x64/bin
# :/media/data3/binsrc/4linux/node-v14.15.4-linux-x64/bin
export PATH="./../../vendor/bin:./vendor/bin:$PATH"
export ANDROID_HOME="/media/data2/links/Android/Sdk"
export GOPATH="$HOME/go"

# override previous java
# export JAVA_HOME=/media/data1/bins/4linux/jdk-11
export AD_HOME=/media/data2/links/android-studio/bin/
export JAVA_HOME=/usr/lib/jvm/java-18-openjdk-amd64/
export JDK_HOME=/usr/lib/jvm/java-18-openjdk-amd64/
export JRE=/usr/lib/jvm/java-18-openjdk-amd64/
# export JAVA_HOME=
# export JDK_HOME=
# export JRE=
export PATH=$PATH:$JRE:$JDK_HOME:$JAVA_HOME/bin

# condas
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:/usr/local/cuda-11.4/lib64:/usr/lib/x86_64-linux-gnu/:/usr/local/cuda-11.1/targets/x86_64-linux/lib/

# pytorch
export CUDA_DEVICE_ORDER="PCI_BUS_ID"
export CUDA_VISIBLE_DEVICES=0

export PYTHONDONTWRITEBYTECODE=1
export FLASK_DEBUG=development

export BASEDIR='/media/data1/_S2/'