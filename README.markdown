Exposition
===========

This is a very boring blogging platform based on Rails geared toward Rails developers. It has very little in the way of frills and is designed to get up and running fast with an easy to understand codebase.

Its built as a Rails Engine and therefore should be easy to customize and extend as you see fit.

This might not be good for you if:
----------------------------------

* You have many contributors and need role based permissions
* If you need to track changes in articles
* Make extensive use of images

Features
--------

* Tagging
* Basic user authentication
* Markdown that support code snippets
* Basic slug management

That's about it for now, though I'm sure features will evolve slowy as needs are recognized through use.

Requirements
------------

This application is currently tested on Rails 5, Ruby 2.3 and the PostgreSQL database.

Setup
-----

Configuration is the same as a typical installation of a Rails Engine

* Create new Rails app
* Include exposition gem by adding `gem 'exposition'` to your Gemfile
* Mount the engine by adding `mount Exposition::Engine, at: "/blog"` to the routes file. You can also mount the engine to your project's root by adding `mount Exposition::Engine, at: "/"` instead.
* Install the migrations by running rake exposition:install:migrations
* Run the migrations `rake db:migrate`
* Add an admin user by using the Rails console `rails exposition:create_user`
* Set the values in the en.yml file to your liking

Customization
-------------

There currently is no theme in place, so the views will have to be styled themselves.

* Frontend views are where you would expect them to be. So:
  * app/views/layouts/exposition/application.html.haml
  * app/views/exposition

* Admin styles and markup are in the Admin namespace. So:
  * app/assets/stylesheets/exposition/admin
  * app/views/layouts/exposition/admin.html.haml
  * app/views/admin/exposition

If you duplicate these files and directories in your project you can override the views and customize them however you like.

### Static Pages

If you would like to add static pages to your site I recommend [High Voltage](https://github.com/thoughtbot/high_voltage "High Voltage"). 

Deployment instructions
-----------------------

You can deploy the app however you like, but I like [Heroku](http://heroku.com "Heroku"). Especially their [hobby plan](https://www.heroku.com/pricing "Heroku Pricing"). To deploy on Heroku:

* `heroku create [your app name]`
* `git push heroku master`
* `heroku run rake db:setup`
* Create your admin user in the console.
  * `heroku run rails console`
  * `rails exposition:create_user`
* `heroku open`

Todo:
-----

* Figure out a clean and easy way to allow image uploads that doesn't complicate setup
* Add RSS support
* Add correct head parameters for SEO

Running the Test Suite
----------------------

`bin/rspec spec`

License
-------

This project rocks and uses MIT-LICENSE.

