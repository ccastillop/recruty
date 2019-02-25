require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger

require 'capistrano/rbenv'
require 'capistrano/rbenv_install'
require 'capistrano/puma'
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require 'capistrano/logrotate'


install_plugin Capistrano::Puma  # Default puma tasks
#install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
#install_plugin Capistrano::Puma::Jungle # if you need the jungle tasks
install_plugin Capistrano::Puma::Monit  # if you need the monit tasks
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template
#install_plugin Capistrano::Logrotate

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
