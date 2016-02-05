# Pull base image
FROM oss17888/centos6.4

# Install EPEL repo
RUN yum install -y epel-release

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  git \
  cppcheck \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  libuuid-devel \
  gdb \
  golang \
  valgrind \
  mysql-devel \
  postgresql93-devel; \
  yum -y clean all

ADD ./install_devtoolset3.sh /script/
RUN /script/install_devtoolset3.sh
ENV PATH /opt/rh/devtoolset-3/root/usr/bin/:$PATH

ADD ./install_cmake32.sh /script/
RUN /script/install_cmake32.sh

ADD ./install_boost158.sh /script/
RUN /script/install_boost158.sh
ENV BOOST_ROOT /usr/local/boost158

ADD ./install_cryptopp.sh /script/
RUN /script/install_cryptopp.sh

ADD ./install_gmock170.sh /script/
RUN /script/install_gmock170.sh

ADD install_python34.sh /script/
RUN /script/install_python34.sh

ADD ./install_cpptools.sh /script/
RUN /script/install_cpptools.sh

# Add root files
ADD ./.bashrc /root/.bashrc
ADD legacy_mode.sh /root/

# Set environment variables
ENV HOME /root

# Define default command
CMD ["bash"]
