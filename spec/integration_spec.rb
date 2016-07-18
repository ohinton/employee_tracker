require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add an employee path', {:type => :feature}) do
  it('adds an employee') do
    visit('/')
    expect(page).to have_content("Add an employee")
    click_link("Add an employee")
    expect(page).to have_content("Add a new employee")
  end
end
