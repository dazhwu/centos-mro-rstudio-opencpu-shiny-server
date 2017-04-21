
FROM mjmg/centos-mro-base:latest

RUN \
  yum clean all && \
  yum update -y && \
  yum install -y yum-utils \
                 rpmdevtools \
                 httpd-devel \
                 libapreq2-devel \
                 libcurl-devel \
                 protobuf-devel \
                 openssl-devel \
                 libpng-devel \
                 libtiff-devel \
                 libjpeg-turbo-devel \
                 fftw-devel \
                 mesa-libGLU-devel \
                 ed \
                 netcdf-devel \
                 git \
                 bzip2-devel \
                 libxml2-devel \
                 libssh2-devel \
                 libicu-devel \
                 tar \
                 curl \
                 mock

RUN \
  useradd -ms /bin/bash mockbuild

USER mockbuild

RUN \
  rpmdev-setuptree

COPY \
  R-fake.spec /tmp/R-fake.spec

RUN \
  rpmbuild -bb /tmp/R-fake.spec

USER root

RUN \
  cd /home/mockbuild/rpmbuild/RPMS/noarch/ && \
  rpm -ivh /home/mockbuild/rpmbuild/RPMS/noarch/R-fake*.rpm

USER mockbuild

RUN \
  cd /home/mockbuild/ && \
  wget http://download.opensuse.org/repositories/home:/jeroenooms:/opencpu-1.6/Fedora_25/src/rapache-1.2.7-2.3.src.rpm && \ 
  wget http://download.opensuse.org/repositories/home:/jeroenooms:/opencpu-1.6/Fedora_25/src/opencpu-1.6.7-11.2.src.rpm && \
  wget http://dl.fedoraproject.org/pub/fedora/linux/releases/25/Everything/source/tree/Packages/t/tcl-8.6.6-1.fc25.src.rpm && \
  wget http://dl.fedoraproject.org/pub/fedora/linux/releases/25/Everything/source/tree/Packages/t/tk-8.6.6-1.fc25.src.rpm

USER root

#RUN \
#  rm /etc/yum.repos.d/CentOS-Sources.repo

RUN \
  yum-builddep -y --nogpgcheck /home/mockbuild/opencpu-1.6.7-11.2.src.rpm

RUN \
  yum-builddep -y --nogpgcheck /home/mockbuild/rapache-1.2.7-2.3.src.rpm

RUN \
  yum-builddep -y --nogpgcheck /home/mockbuild/tcl-8.6.6-1.fc25.src.rpm

#RUN \
#  yum-builddep -y --nogpgcheck /home/builder/tk-8.6.6-1.fc25.src.rpm

RUN \
  ln /usr/lib64/microsoft-r/3.3/lib64/R/share/ /usr/share/R -s && \
  ln /usr/lib64/microsoft-r/3.3/lib64/R/lib/ /usr/lib/R -s && \
  ln /usr/lib64/microsoft-r/3.3/lib64/R/include /usr/lib/R/include -s

RUN \
  echo "/usr/lib64/microsoft-r/3.3/lib64/R/lib" >> /etc/ld.so.conf.d/microsoft-r-lib.conf && \
  ldconfig

USER mockbuild

RUN \
  cd ~ && \
  rpm -ivh rapache-1.2.7-2.1.src.rpm && \
  rpmbuild -ba ~/rpmbuild/SPECS/rapache.spec

RUN \
  cd ~ && \
  rpm -ivh opencpu-1.6.2-7.1.src.rpm && \
  rpmbuild -ba ~/rpmbuild/SPECS/opencpu.spec

RUN \
  cd ~ && \
  rpm -ivh tcl-8.6.6-1.fc25.src.rpm && \
  rpmbuild -ba ~/rpmbuild/SPECS/tcl.spec

USER root

RUN \
  cd /home/mockbuild/rpmbuild/RPMS/x86_64/ && \
  yum erase -y tcl tk && \
  yum install -y ./tcl-devel-8.6.6-1.el7.centos.x86_64.rpm ./tcl-8.6.6-1.el7.centos.x86_64.rpm

RUN \
  yum-builddep -y --nogpgcheck /home/mockbuild/tk-8.6.6-1.fc25.src.rpm


USER mockbuild

RUN \
  cd ~ && \
  rpm -ivh tk-8.6.6-1.fc25.src.rpm && \
  rpmbuild -ba ~/rpmbuild/SPECS/tk.spec

USER root

RUN \
  yum install -y MTA mod_ssl /usr/sbin/semanage && \
  yum install -y /home/mockbuild/rpmbuild/RPMS/x86_64/rapache-*.rpm && \
  yum install -y /home/mockbuild/rpmbuild/RPMS/x86_64/opencpu-lib-*.rpm && \
  yum install -y /home/mockbuild/rpmbuild/RPMS/x86_64/opencpu-server-*.rpm && \
  yum install -y /home/mockbuild/rpmbuild/RPMS/x86_64/./tk-devel-8.6.6-1.el7.centos.x86_64.rpm \
                 /home/mockbuild/rpmbuild/RPMS/x86_64/tk-8.6.6-1.el7.centos.x86_64.rpm

# Cleanup
RUN \
  rm -rf /home/mockbuild/* && \
  userdel mockbuild && \
  yum erase mock -y && \
  yum autoremove -y

# Configure default shiny user with password shiny
RUN \
  useradd -m shiny && \
  echo "shiny:shiny" | chpasswd

USER root

WORKDIR /tmp

RUN \
  wget https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm && \
  wget https://download3.rstudio.org/centos5.9/x86_64/shiny-server-1.5.3.838-rh5-x86_64.rpm


RUN \
  echo "Installing shiny from CRAN" && \
  Rscript -e "install.packages('shiny', repos='https://cloud.r-project.org/')"

# Add default root password with password r00tpassw0rd
RUN \
  echo "root:r00tpassw0rd" | chpasswd

RUN \
  yum install -y --nogpgcheck /tmp/shiny-server-1.5.3.838-rh5-x86_64.rpm && \
  rm -f /tmp/shiny-server-1.5.3.838-rh5-x86_64.rpm

RUN \
  yum install -y --nogpgcheck /tmp/rstudio-server-rhel-1.0.143-x86_64.rpm && \
  rm -f /tmp/rstudio-server-rhel-1.0.143-x86_64.rpm

# install additional packages
ADD \
  installRpackages.sh /tmp/installRpackages.sh
RUN \
  chmod +x /tmp/installRpackages.sh && \
  /tmp/installRpackages.sh


# Server ports
EXPOSE 80 443 9001


# Add supervisor conf files
ADD \
  ./etc/supervisor/conf.d/rstudio-server.conf /etc/supervisor/conf.d/rstudio-server.conf
ADD \
  ./etc/supervisor/conf.d/opencpu-server-httpd.conf /etc/supervisor/conf.d/opencpu-server-httpd.conf
ADD \
  ./etc/supervisor/conf.d/shiny-server.conf /etc/supervisor/conf.d/shiny-server.conf

# Update rstudio server configuration
RUN \
  rm -f /etc/httpd/conf.d/rstudio.conf
ADD \
  ./etc/httpd/conf.d/rstudio-server.conf /etc/httpd/conf.d/rstudio-server.conf
# Use SSL and password protect shiny-server with shiny:shiny
ADD \
  ./etc/httpd/conf.d/shiny-httpd.conf /etc/httpd/conf.d/shiny-httpd.conf
ADD \
  ./etc/httpd/conf.d/shinypasswd /etc/httpd/conf.d/shinypasswd
# Force SSL for everything
ADD \
  ./etc/httpd/conf.d/force-ssl.conf /etc/httpd/conf.d/force-ssl.conf

RUN \
  mkdir -p /var/log/shiny-server && \
  chown shiny:shiny /var/log/shiny-server && \
  mkdir /srv/shiny-server/apps/ && \
  mkdir /srv/shiny-server/rmd/ && \
  chown shiny:shiny -R /srv/shiny-server && \
  chmod 777 -R /srv/shiny-server && \
  chown shiny:shiny -R /opt/shiny-server/ && \
  chmod 777 -R /opt/shiny-server/samples/sample-apps

USER shiny

RUN \
  mkdir /home/shiny/shiny-server/ && \
  ln /srv/shiny-server/apps /home/shiny/shiny-server/apps -s && \
  ln /srv/shiny-server/rmd /home/shiny/shiny-server/rmd -s

USER root

# Define default command.
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]

