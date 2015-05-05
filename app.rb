require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/task'
require './lib/list'
require 'pg'

DB = PG.connect({:dbname => "to_do_database"})

get('/') do
  @lists = List.all()
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  @list = List.new({:name => params.fetch("name"), :id => nil}).save()
  @lists = List.all()
  erb(:list_success)
end

get("/lists") do
  @lists = List.all()
  erb(:index)
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i)
  erb(:task_list)
end

get('/lists/:id/task/new') do
  @list = List.find(params.fetch('id').to_i())
  erb(:task_form)
end

post("/tasks") do
  name = params.fetch("name")
  task_type = params.fetch("task_type").to_i()
  @list = List.find(task_type)
  @task = Task.new({:name => name, :task_type => task_type})
  @task.save()
  erb(:task_success)
end
