Tapatracker
===========

Getting started
---------------

### Setup facebook connect

There are two configurations available, one for pow and one for running on localhost:3000. 

localhost:3000 add "source ~/Dropbox/granadajs/tapatracker/facebook-connect-localhost" to ~/.bash_profile

For tapatracker-server.dev add 
"source ~/Dropbox/granadajs/tapatracker/facebook-connect-pow" to ~/.bash_profile


### Install poltergeist
Used for running javascript tests with capybara
See instructions on https://github.com/jonleighton/poltergeist


### Spinach
To run integration tests run
$ bundle exec spinach

See https://github.com/codegram/spinach and https://github.com/codegram/spinach-rails for more info.