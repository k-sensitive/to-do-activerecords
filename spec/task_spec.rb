require 'spec_helper'

describe(Task) do

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:task_type => 1, :name => "learn SQL"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe("#name") do
    it("let's you describe the task") do
      test_task = Task.new({:task_type => 1, :name => "learn SQL"})
      expect(test_task.name()).to(eq("learn SQL"))
    end
  end

  describe("#task_type") do
    it("lets you read the list ID out") do
      test_task = Task.new({:task_type => 1, :name => "learn SQL"})
      expect(test_task.task_type()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same name and list ID") do
      task1 = Task.new({:task_type => 1, :name => "learn SQL"})
      task2 = Task.new({:task_type => 1, :name => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end
end
