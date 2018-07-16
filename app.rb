require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/division')
require('./lib/employee')
require('pry')
require('pg')

get('/') do
  erb(:index)
end

get('/hr-home') do
  @divisions = Division.all
  @employees = Employee.all
  erb(:hr_home)
end

post('/hr-home') do
  if params.has_key?('new_division')
    division_name = params.fetch("new_division")
    @division = Division.create({:name => division_name})
    @divisions = Division.all
    @employees = Employee.all
  else
    employee_name = params.fetch("add_employee")
    @employee = Employee.create({:name => employee_name, :division_id => nil})
    @employees = Employee.all
    @divisions = Division.all
  end
  erb(:hr_home)
end

get('/hr-home/:name') do
  binding.pry
  @division = Division.find_by(name: params.fetch("name"))
  @divisions = Division.all
  erb(:edit_division)
end

get('/hr-home/:id') do

  @employee = Employee.find(params.fetch('id').to_i)
  @employees = Employee.all
  erb(:edit_employee)
end

patch('/hr-home/Employee-:id') do
  @employee = Employee.update_attributes(:name => params.fetch('update_employee'))
  erb(:edit_employee)
end
