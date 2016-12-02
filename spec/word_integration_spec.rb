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
  it('clicks submit and takes user to new Word success page') do
    fill_in("word", :with => "peak")
    click_button("Submit New Word")
    expect(page).to have_content('Success!  You added a new Word')
  end
  it('clicks link and takes user to Word List page, tests for successfully appending word') do
    fill_in("word", :with => "trail")
    click_button("Submit New Word")
    click_link("View Word List")
    expect(page).to have_content("trail")
  end
  # it('clicks word to view definition entry form') do
  #   fill_in("word", :with => "hike")
  #   click_button("Submit New Word")
  #   click_link("View Word List")
  #   expect(page).to have_content("hike")
  #   click_link("hike")
  #   expect(page).to have_content("Word definitions for")
  # end


end
