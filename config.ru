require './config/environment'
require 'rubygems'
require 'sinatra'

run Sinatra::Application

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use MovieController
use UsersController
run ApplicationController
