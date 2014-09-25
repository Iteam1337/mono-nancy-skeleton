FROM ubuntu:12.04
MAINTAINER mattcollinge

RUN apt-get -q update
RUN apt-get -y -q install wget
RUN wget -q http://download.opensuse.org/repositories/home:tpokorra:mono/xUbuntu_12.04/Release.key -O- | apt-key add -
RUN apt-get remove -y --auto-remove wget
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/home:/tpokorra:/mono/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/mono-opt.list"
RUN apt-get -q update
RUN apt-get -y -q install mono-opt 
RUN apt-get -y -q install mono-devel

RUN mozroots --import --sync --machine
ENV PATH /opt/mono/bin:${PATH}
ENV LD_LIBRARY_PATH /opt/mono/lib:${LD_LIBRARY_PATH}
CMD mkdir /src
ADD ./ /src

RUN EnableNuGetPackageRestore=true xbuild /property:Configuration=Release /property:OutDir=./ /src/*.sln
# `find . -maxdepth 1 -iname "*.sln" | head -1`

EXPOSE 5000

CMD ["mono" "bin/*.exe"]
