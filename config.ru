require './config/environment'
require_relative './models/movie'

run Sinatra::Application

path = File.expand_path "../", __FILE__
require 'rubygems'
require 'sinatra'
require "#{path}/movies"
run Sinatra::Application

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use MovieController
use UsersController
run ApplicationController
