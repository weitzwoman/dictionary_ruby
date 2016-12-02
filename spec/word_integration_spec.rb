require('capybara/rspec')
require('./app')
require('word')
require('definition')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('takes user to target route', {:type => :feature}) do
  before() do
    visit('/')
    click_link('Add a new Word')
  end
  it('clicks link and takes user to form page') do
    expect(page).to have_content('New Word')
  end

end
