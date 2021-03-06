$:.push File.expand_path("../lib", __FILE__)

require "exposition/version"

Gem::Specification.new do |s|
  s.name        = "exposition"
  s.version     = Exposition::VERSION
  s.authors     = ["Josh Klina"]
  s.email       = ["joshua.klina@gmail.com"]
  s.homepage    = "http://jklina.github.io/exposition"
  s.summary     = "A simple blogging engine in Rails designed to get you up and running quickly."
  s.description = "A very simple and boring blogging engine for Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 6.0"
  s.add_dependency "pg"
  s.add_dependency "haml"
  s.add_dependency "erubis"
  s.add_dependency 'bcrypt', '~> 3.1'
  s.add_dependency 'redcarpet', '~> 3.0'
  s.add_dependency 'rouge', '~> 2.0'
  s.add_dependency 'kaminari'
  s.add_dependency 'categorical'
  s.add_dependency 'sass-rails'
  s.add_dependency 'human_urls', '~> 0.1.6-alpha.0'

  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails", "4.0.0.beta3"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency 'capybara-selenium'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency 'faker'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'webdrivers'
end
