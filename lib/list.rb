class List

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM list;")
    lists = []
    returned_lists.each do |list|
      id = list.fetch("id").to_i()
      name = list.fetch("name")
      lists.push(List.new({:id => id, :name => name}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO list (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name())
  end

  define_singleton_method(:find) do |id|
    found_list = nil
    List.all().each() do |list|
      if list.id().==(id)
        found_list = list
      end
    end
    found_list
  end

  define_method(:tasks) do
    list_tasks = []
    tasks = DB.exec("SELECT * FROM task WHERE task_type = #{self.id()};")
    tasks.each() do |task|
      name = task.fetch("name")
      list_id = task.fetch("task_type").to_i()
      list_tasks.push(Task.new({:name => name, :task_type => list_id}))
    end
    list_tasks
end
end


#list_id?
