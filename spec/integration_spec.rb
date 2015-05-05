require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the index page path', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save()
    # test_task = Task.new({:name => "learn SQL", :task_type => 1})
    # test_task.save()
    visit('/')
    click_link(test_list.name())
    expect(page).to have_content(test_list.name())
  end

  it ('allows user to add list') do
    visit('/lists/new')
    fill_in("name", with: "new list")
    click_button('Add List')
    expect(page).to have_content('Success')
  end

#   it('Allows the user to see tasks for the selected list') do
#
#   end
  end
