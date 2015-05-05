class Task

  attr_reader(:list_id, :description, :type)

  define_method(:initialize) do |attributes|
    @list_id = attributes.fetch(:list_id)
    @description = attributes.fetch(:description)
    @type = attributes.fetch(:due_date)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each do |task|
      list_id = task.fetch("list_id").to_i()
      description = task.fetch("description")
      type = task.fetch("type")
      tasks.push(Task.new({:list_id => list_id, :description => description, :due_date => due_date}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (list_id, description, due_date) VALUES (#{@list_id}, '#{@description}', '#{@due_date}')")
  end
#
#   define_method(:==) do |another_task|
#     self.description().==(another_task.description())
#   end
end
