require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
require('pg')
require('pry')

get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get('/division') do
  @divisions = Division.all()
  erb(:new_division)
end

post('/division') do
  division = params.fetch("name")
  @division = Division.create({:name => division, :id => nil})
  @divisions = Division.all()
  erb(:index)
end

get('/division/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch('/division/:id') do
  division = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => division})
  @divisions = Division.all()
  erb(:index)
end

delete("/division/:id/delete") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end



get('/employee') do
  @employees = Employee.all()
  erb(:new_employee)
end

post('/employee') do
  employee = params.fetch("name")
  @employee = Employee.create({:name => employee, :id => nil})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

get('/employee/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch('/employee/:id') do
  employee = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => employee})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

delete("/employee/:id/delete") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end
