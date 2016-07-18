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
