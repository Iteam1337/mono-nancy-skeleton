FROM thaiphan/mono
ADD .
RUN xbuild *.sln
CMD ["mono", "src/bin/*.exe"]