require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create new Tamagotchi', {:type => :feature}) do
  it ("takes in a user's name for their pet and creates the pet.") do
    visit('/')
    fill_in('name', :with => "monster")
    click_button('Meet your pet!')
    expect(page).to have_content("monster")
  end
end

describe('feed Tamagotchi', {:type => :feature}) do
  it ("increases the pet's food level.") do
    visit('/creature')
    click_button('Feed your pet!')
    expect(page).to have_content("monster")
  end
end
