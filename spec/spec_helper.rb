require 'rspec'
require 'pg'
require 'list'
require 'task'

DB = PG.connect({:dbname => 'to_do_database'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM task *;")
    DB.exec("DELETE FROM list *;")
  end
end
