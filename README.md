# README

Deployed on Google Cloud

Accessing Google Engine Rails console: 

https://gist.github.com/kyptin/e5da270a54abafac2fbfcd9b52cafb61

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

## server

    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs nginx mysql-server mysql-common libmysqlclient-dev

* Configuration

    https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

At first, I deployed using Google Cloud services but they told me that I am a cryptocurrency miner, so the drop my account.

Therefore I started using a plain simple Digital Ocean droplet, an [Mine](https://github.com/mina-deploy/mina/blob/master/docs/getting_started.md) simple deploy procedure, as explained in [this tutorial](https://www.ralfebert.de/tutorials/rails-deployment/)

https://www.ralfebert.de/tutorials/rails-deployment/

