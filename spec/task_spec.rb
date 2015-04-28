require 'rspec'
require 'task'

describe(Task) do
  describe("#description") do
    it("let's you describe the task") do
      test_task = Task.new("do the chores")
      expect(test_task.description()).to(eq("do the chores"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("do the dishes")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("clears out all saved tasks") do
      Task.new("do the dishes").save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end
end
