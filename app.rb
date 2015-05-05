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
  erb(:success)
end

get("/lists") do
  @lists = List.all()
  erb(:index)
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i)
  erb(:task_list)
end
