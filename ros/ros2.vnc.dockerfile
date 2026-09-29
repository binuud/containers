FROM ubuntu:26.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=lyrical

# Set up locale
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8

# Install system essentials, desktop environment (XFCE), and VNC/noVNC tools
# Binu: donot combine the install commands, for debugging purpose, keeping vnc part seperate, so we can use cache builds to debug
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg2 \
    lsb-release \
    ca-certificates \
    git \
    supervisor \
    net-tools \
    xfce4 \
    xfce4-terminal \
    libxcb-cursor0 \
    libxcb-util1 libxinerama1

RUN apt-get update && apt-get install -y --no-install-recommends \    
    tigervnc-standalone-server \
    tigervnc-common \
    tigervnc-tools \
    novnc \
    websockify \
    python3-pip 

RUN apt-get update && apt-get install -y --no-install-recommends \
    dbus-x11 \
    net-tools \
    vim \
    build-essential



SHELL ["/bin/bash", "-c"]

RUN export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F'"' '{print $4}') &&  \
export ROS_MY_PKG_PATH="https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME})_all.deb" && \
echo $ROS_MY_PKG_PATH &&  curl -L -o /tmp/ros2-apt-source.deb "${ROS_MY_PKG_PATH}"
RUN dpkg -i /tmp/ros2-apt-source.deb

# Setup ROS 2 Lyrical GPG key and repository
# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
#     && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://ros.org $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros2.list

# Install ROS 2 Lyrical Desktop and development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-desktop \
    python3-colcon-common-extensions \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init || true && rosdep update

## Install the necessary ros tutorial

RUN apt-get install ros-lyrical-xacro
RUN apt-get install -y apt-get install ros-lyrical-turtlesim
RUN apt-get install -y ros-lyrical-joint-state-publisher ros-lyrical-joint-state-publisher-gui
RUN apt-get install -y urdf_tutorial

## install gazebo
RUN apt-get install -y ros-lyrical-ros-gz python-serial

## remove same in final build
## RUN rm -rf /var/lib/apt/lists/*

# Configure noVNC to point to localhost:5901 (TigerVNC default)
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Create startup script for VNC, Websockify/noVNC, and XFCE
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir /ros2-ws
WORKDIR /ros2-ws

EXPOSE 6080

## RUN echo "source /opt/ros/lyrical/setup.bash"  >> /etc/bash.bashrc

# Copy your local mybash.rc file into the container's root home directory
COPY mybash.rc /root/mybash.rc

# Append the contents of mybash.rc to ~/.bashrc and then clean up the temp file
RUN cat /root/mybash.rc >> /etc/bash.bashrc && rm /root/mybash.rc

# USER ubuntu

ENV USER=ubuntu
ENV PASSWORD=ubuntu

ENTRYPOINT ["/entrypoint.sh"]
