require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/task'
require './lib/list'
require 'pg'

DB = PG.connect({:dbname => "to_do_database"})

get("/") do
  @lists = List.all()
  erb(:index)
end

# post("/tasks") do
#   description = params.fetch("description")
#   task = Task.new(description)
#   task.save()
#   erb(:success)
# end
