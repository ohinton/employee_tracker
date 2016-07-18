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

get('/divisions') do
  @divisions = Division.all()
  erb(:new_division)
end

post('/divisions') do
  division = params.fetch("name")
  @division = Division.create({:name => division})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:division_edit)
end

patch('/divisions/:id') do
  division = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => division})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

delete("/divisions/:id/delete") do
  @division = Division.find(params.fetch("id").to_i())
  @division.delete()
  @divisions = Division.all()
  erb(:index)
end



get('/employees') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:new_employee)
end

post('/employees') do
  employee = params.fetch("name")
  division_id = params.fetch("division_id")
  @employee = Employee.create({:name => employee, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  @divisions = Division.all()
  erb(:employee_edit)
end

patch('/employees/:id') do
  employee = params.fetch("name")
  division_id = params.fetch("division_id")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => employee, :division_id => division_id})
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

delete("/employees/:id/delete") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end
