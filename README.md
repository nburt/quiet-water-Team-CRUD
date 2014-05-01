# Media Manager:
This is an application for managing media. It currently supports pictures and youtube videos.

# Travis CI Build Status:[![Build Status](https://travis-ci.org/nburt/quiet-water-Team-CRUD.svg?branch=master)](https://travis-ci.org/nburt/quiet-water-Team-CRUD)

# Heroku Staging:
http://quiet-water-staging.herokuapp.com/

# Heroku Production:
http://quiet-water-production.herokuapp.com/

# Tracker URL:

https://www.pivotaltracker.com/n/projects/1069192

# Getting the App Running on your Local Machine:

## Development:
1. `bundle install`
1. Create a database by running `rake db:create`
1. Run the migrations in the development database using `rake db:migrate`
1. Run the migrations in the test database using `RACK_ENV=test rake db:migrate`
1. `rails s`
1. Run tests using `rake spec`.

## Running on Heroku:
1. Create heroku app by running `heroku apps:create <your app name>`
1. To run the migrations on heroku, run `heroku run 'rake db:migrate' --app <your app name>`
