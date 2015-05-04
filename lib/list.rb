class List

  # @task_list = []
  # @number_of_tasks = @task_list.length

  attr_reader(:id, :name, :type)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each do |list|
      id = list.fetch("id").to_i()
      name = list.fetch("name")
      type = list.fetch("type")
      lists.push(List.new({:id => id, :name => name, :type => type}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name, type) VALUES ('#{@name}', '#{@type}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

#   define_method(:==) do |another_list|
#     self.name().==(another_list.name())
#   end
#
#   define_singleton_method(:add_task) do |task|
#     @tasks_list.push(task)
#   end
#
  # define_method(:task_list) do
  #   @task_list
  # end
end
