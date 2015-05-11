require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**/*.rb'
require './lib/task'
# require './lib/list'
require 'pg'
require 'pry'


get('/') do
  @tasks = Task.all()
  erb(:index) #/tasks/add /tasks/:id/edit
end

get('/tasks/add') do
  erb(:task_form) #/tasks
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch('id').to_i())
  erb(:task_edit) #/tasks/:id
end

post('/tasks') do
  description = params.fetch('description')
  due_date = params.fetch('due_date')
  Task.create({:description => description, :done => false, :due_date => due_date})
  @tasks = Task.all()
  erb(:index) #/tasks
end

patch('/tasks/:id') do
  description = params.fetch('description')
  done = params.fetch('done')
  done = done[0]
  @task = Task.find(params.fetch('id').to_i())
  @task.update({:description => description, :done => done})
  @tasks = Task.all()
  redirect('/') #/tasks/:id
end
