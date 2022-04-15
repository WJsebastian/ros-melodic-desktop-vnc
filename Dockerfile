FROM dorowu/ubuntu-desktop-lxde-vnc:bionic
LABEL maintainer="WJSebastian <wj_sebastian@outlook.com>"

RUN sudo sh -c \
    'echo "deb http://packages.ros.org/ros/ubuntu \
    $(lsb_release -sc) main" > \ 
    /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt install curl && \ 
# if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc \
| sudo apt-key add -

RUN sudo apt update &&\
    sudo apt install ros-melodic-desktop-full
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc &&\
    source ~/.bashrc
RUN sudo apt install \
    python-rosdep python-rosinstall python-rosinstall-generator \
    python-wstool build-essential
RUN sudo apt install python-rosdep
RUN sudo rosdep init &&\
    rosdep update