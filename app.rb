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
    division_title = params.fetch("new_division")
    @division = Division.create({:title => division_title})
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

get('/hr-home/:title') do
  @division = Division.find_by(title: params.fetch("title"))
  @divisions = Division.all
  erb(:edit_division)
end

get('/hr-home/employee/:id') do
  @employee = Employee.find(params.fetch('id').to_i)
  @employees = Employee.all
  binding.pry
  erb(:edit_employee)
end

patch('/hr-home/employee/:id') do
  @employee = Employee.update_attributes(:name => params.fetch('update_employee'))
  erb(:edit_employee)
end
