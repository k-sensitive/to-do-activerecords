require 'spec_helper'

describe(List) do

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:id => nil, :name => "Epicodus Homework", :type => "Homework"})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:id => nil, :name => "Epicodus Homework", :type => "Homework"})
      expect(list.name()).to(eq("Epicodus Homework"))
    end
  end

  describe('#type') do
    it("tells you its type") do
      list = List.new({:id => nil, :name => "Epicodus Homework", :type => "Homework"})
      expect(list.type()).to(eq("Homework"))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:id => nil, :name => "Epicodus Homework", :type => "Homework"})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end
#
#   describe("#==") do
#     it("is the same list if it has the same name") do
#       list1 = List.new({:id => nil, :name => "Epicodus stuff"})
#       list2 = List.new({:id => nil, :name => "Epicodus stuff"})
#       expect(list1).to(eq(list2))
#     end
#   end

  # describe("#task_list") do
  #   it("is empty at first") do
  #     list = List.new({:id => nil, :name => "Epicodus Homework", :type => "Homework"})
  #     expect(list.task_list).to(eq(nil))
  #     expect(list.number_of_tasks).to(eq(nil))
  #   end
  # end
end
