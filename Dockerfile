FROM ros:noetic-ros-base

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    git \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-aarch64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH="/opt/conda/bin:${PATH}"

# Initialize ros
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# Set the working directory
WORKDIR /visualnav-transformer

# Set the entrypoint
ENTRYPOINT ["/bin/bash"]
#CMD ["bash"]