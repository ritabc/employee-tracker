ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('division')
require('employee')
require('rspec')
require('pry')
require('pg')

RSpec.configure do |config|
  config.after(:each) do
    Division.all.each do |division|
      division.destroy
    end
    Employee.all.each do |employee|
      employee.destroy
    end
  end
end
