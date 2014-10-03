Demo project for hosting Nancy and Mono on Dokku
=================================================

Set up mono buildpack on Dokku
------------------------------
To use the samples below you first need to install buildpack with mono support on your dokku machine. Please follow instructions on [https://github.com/Iteam1337/buildstep](https://github.com/Iteam1337/buildstep).


Build locally
-------------
Before deploying your source code you will need to ensure that it builds locally. For example:

	$ xbuild Nancy.Demo.Hosting.Self.sln

Procfile
--------
Web specifies the command Heroku executes to start the application. The path to Mono should not be changed, this is specified within the Buildpack.

To test running your application locally, execute the following:

	$ foreman start local
  
