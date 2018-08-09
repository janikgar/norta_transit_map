# NORTA Tracker App

This app is designed to help show you information about New Orleans Regional Transit Authority routes.

## Build Requirements
- Docker Alpine & postgres images
- Ruby ~> 2.3.3
- Rails ~> 5.2.0
- PostgreSQL ~> 10.4
### Gems Used
- [jquery-rails](https://github.com/rails/jquery-rails)
- [bootstrap-sass](https://github.com/twbs/bootstrap-sass)
- [figaro](https://github.com/laserlemon/figaro)
- [omniauth-facebook](https://github.com/omniauth/omniauth)
- [omniauth-github](https://github.com/omniauth/omniauth)
- [gtfs (transitland fork)](https://github.com/transitland/gtfs.git)
- [yaml_db](https://github.com/adamwiggins/yaml_db)
#### For development only
- [rspec-rails](https://github.com/rspec/rspec-rails)

## Build
In order to have the OmniAuth gems function, Facebook and Github API Keys & Secrets are required. They can be set in `config/application.yml` with the following:
```
FACEBOOK_APP_ID: \# Facebook key here
FACEBOOK_APP_SECRET: \# Facebook secret here

GITHUB_KEY: \# GitHub key here
GITHUB_SECRET: \# GitHub secret here
```
Most of the data are held in local JSON files and read at run time, though these are being transitioned into the PG database. Helpers are in place to pull info from Transit.land's or NORTA's GTFS feeds.

## Test
Tests have been constructed using RSpec/Capybara/Chromedriver. These can be run with `$ rspec`.

I have also begun using SemaphoreCI for continuous integration, but this will show failed tests until I have replaced or removed all pending tests.

## Deployment
To run in Docker, make sure that the `docker-compose.yml` and `Dockerfile` both exist in the root directory. You will need Docker Store credentials to pull the images. The following commands should get you up and going:
```
$ docker-compose build
... image will build here, including bundle install ...
$ docker-compose run web rake db:setup
... databases will be created ...
$ docker-compose up
```
If Docker is set up correctly, you will find the server at 10.0.75.1.
