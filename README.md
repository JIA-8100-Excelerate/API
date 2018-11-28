# API for Excelerate App

## Deploying the Server
1. [Use git to clone the repository](https://help.github.com/articles/cloning-a-repository/).
2. Check if Rails 5.0 or higher is installed on your system by running `rails -v` in your Terminal. If you need to install Rails, follow [this guide](http://www.installrails.com). Once Rails is installed, run `gem install bundler`, then `bundle install`.
3. Install the Heroku Command Line Interface (CLI) by following [these instructions](https://devcenter.heroku.com/articles/heroku-cli#download-and-install).
4. Make sure you are in the directory that contains your Rails app, then create an app on Heroku by running `heroku create`.
5. Deploy your code by running `git push heroku master`.
6. Create the database on the server from the [schema file](https://github.com/JIA-8100-Excelerate/API/blob/master/db/schema.rb). To do this, run `heroku run rake db:schema:load`.

You can view your deployments (as a list of releases) by running `heroku releases`.
