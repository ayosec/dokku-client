# Dokku client

This client is a simple wrapper to launch Dokku commands over SSH.

The address of your Dokku instance is extracted from the repository URL.

    $ git remote add dokku-production dokku@internal.example.com:myapp
    $ git push -u dokku-production master
    [...]

    $ dokku 
    Using app name myapp in dokku@internal.example.com
        config                                    display the config vars for an app
        config:get KEY                            display a config value for an app
        config:set KEY1=VALUE1 [KEY2=VALUE2 ...]  set one or more config vars
        config:unset KEY1 [KEY2 ...]              unset one or more config vars
        delete                                    Delete an application
        logs [-t]                                 Show the last logs for an application (-t follows)
        run <cmd>                                 Run a command in the environment of an application
        url                                       Show the URL for an application

    $ dokku logs -t
    Using rack adapter
    Thin web server (v1.6.2 codename Doc Brown)
    Maximum connections set to 1024
    [...]

## Installation

    $ sudo wget -O /usr/local/bin/dokku https://github.com/ayosec/dokku-client/raw/master/dokku-client.rb
    $ sudo chmod + /usr/local/bin/dokku
