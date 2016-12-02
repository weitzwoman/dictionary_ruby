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
  it('clicks word to view Word Page with definition entry form') do
    fill_in("word", :with => "hike")
    click_button("Submit New Word")
    click_link("View Word List")
    expect(page).to have_content("hike")
    click_link("hike")
    expect(page).to have_content("Word definitions for hike")
  end
  it('clicks add new definition button to view definition entry form') do
    click_button("Submit New Word")
    click_link("View Word List")
    click_link("")
    click_link("Add a definition")
    expect(page).to have_content("New Definition")
  end
  it('clicks add definition button to view definition entry form') do
    fill_in("word", :with => "lake")
    click_button("Submit New Word")
    click_link("View Word List")
    click_link("lake")
    click_link("Add a definition")
    click_button("Submit New Definition")
    expect(page).to have_content("")
  end

end
