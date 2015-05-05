require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('To Do Lists', {:type => :feature}) do
#   it('allows the user to see all the lists') do
#     visit('/')
#
#     expect(page).to have_content('To Do Lists')
#   end
# end


describe('seeing details for a single test', {:type => :feature}) do
  it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School stuff'})
    test_list.save()
    # test_task = Task.new({:name => "learn SQL", :task_type => 1})
    # test_task.save()
    visit('/')
    # click_link(test_list.name())
    expect(page).to have_content(test_list.name())
  end
end
