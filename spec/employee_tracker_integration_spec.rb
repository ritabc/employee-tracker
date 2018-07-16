require ('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the different user types', {:type => :feature} do
  it ('takes the user to the homepage') do
    visit '/'
    expect(page).to have_content('Select your user type')
  end
end

describe 'shows the new division on the page', {:type => :feature} do
  it ('takes user input for new division') do
    visit '/hr-home'
    fill_in('new_division', :with => 'Sales')
    click_button('Add Division')
    expect(page).to have_content('Sales')
  end
end
