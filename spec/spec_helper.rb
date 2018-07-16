ENV['RACK_ENV'] = 'test'

require('rspec')
require('pg')
require('sinatra/ActiveRecord')
require('task')
require('list')
