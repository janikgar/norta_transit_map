# NORTA Tracker App

This app is designed to help show you information about New Orleans Regional Transit Authority routes.

## Build Requirements
- Ruby ~> 2.3.3
- Rails ~> 5.2.0
- PostgreSQL ~> 10.4
### Gems Used
- jquery-rails
- bootstrap-sass
- figaro
- omniauth-facebook
- omniauth-github
- gtfs https://github.com/transitland/gtfs.git
- yaml_db
#### For development only
- pry-rails
- better_errors
- binding_of_caller
- rspec-rails

## Build
In order to have the OmniAuth gems function, Facebook and Github API Keys & Secrets are required. They can be set in `config/application.yml` with the following:
`FACEBOOK_APP_ID: # Facebook key here
FACEBOOK_APP_SECRET: # Facebook secret here

GITHUB_KEY: # GitHub key here
GITHUB_SECRET: # GitHub secret here`

In order to populate the database, the most up-to-date NORTA GTFS file is included at `app/assets/temp.zip` (TODO: change this name). The application helper `helper.get_all_models` can be run from this local file in a Rails console.

Alternatively, the most up-to-date database can also be included using yaml_db by running `$ rake db:data:load` from the command line.

## Test
Tests have been constructed using RSpec/Capybara/Chromedriver. These can be run with `$ rspec`

## Deployment
Note that these create a few fairly large tables. *Shape* and *StopTime* are very lengthy. Be aware of this before deployment.
