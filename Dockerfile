FROM thaiphan/mono
CMD mkdir /src
ADD ./ /src

RUN EnableNuGetPackageRestore=true xbuild /property:Configuration=Release /property:OutDir=./ /src/*.sln
EXPOSE 5000

CMD ["mono", "/src/bin/*.exe"]
