class Task

  attr_reader(:task_type, :name)

  define_method(:initialize) do |attributes|
    @task_type = attributes.fetch(:task_type)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM task;")
    tasks = []
    returned_tasks.each do |task|
      task_type = task.fetch("task_type").to_i()
      name = task.fetch("name")
      tasks.push(Task.new({:task_type => task_type, :name => name}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO task (name, task_type) VALUES ('#{@name}', #{@task_type});")
  end

  define_method(:==) do |another_task|
    self.name().==(another_task.name())
  end
end
