require './config/environment'

set :root, './'
run Sinatra::Application

path = File.expand_path "../", __FILE__
require 'rubygems'
require 'sinatra'

run Sinatra::Application

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use MoviesController
use UsersController
run ApplicationController
