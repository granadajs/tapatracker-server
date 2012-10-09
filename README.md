Tapatracker
===========

Getting started
---------------

### Setup facebook connect

There are two configurations available, one for pow and one for running on localhost:3000. 

localhost:3000 add the following line to your ~/.bash_profile

    source ~/Dropbox/granadajs/tapatracker/facebook-connect-localhost

For tapatracker-server.dev add the following line to your ~/.bash_profile

    source ~/Dropbox/granadajs/tapatracker/facebook-connect-pow


### Install poltergeist
Used for running javascript tests with capybara
See instructions on https://github.com/jonleighton/poltergeist


### Spinach
To run integration tests run

    $ bundle exec spinach

See https://github.com/codegram/spinach and https://github.com/codegram/spinach-rails for more info.