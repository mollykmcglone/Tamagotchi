require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create new Tamagotchi', {:type => :feature}) do
  it ("takes in a user's name for their pet and creates the pet.") do
    visit('/')
    fill_in("pet_name", :with => "monster")
    click_button('meet_pet')
    expect(page).to have_content("monster")
  end
end

describe('feed Tamagotchi', {:type => :feature}) do
  it ("increases the pet's food level by two when a user clicks on the feed pet button.") do
    visit('/')
    fill_in("pet_name", :with => "monster")
    click_button('meet_pet')
    click_button('feed_pet')
    expect(page).to have_content("Your pet's food level: 12")
  end
end

describe('play with Tamagotchi', {:type => :feature}) do
  it ("increases the pet's play level by two when a user clicks on the play with pet button.") do
    visit('/')
    fill_in("pet_name", :with => "monster")
    click_button('meet_pet')
    click_button('play_pet')
    expect(page).to have_content("Your pet's activity level: 12")
  end
end

describe('give Tamagotchi a nap', {:type => :feature}) do
  it ("increases the pet's sleep level by two when a user clicks on the give pet a nap button.") do
    visit('/')
    fill_in("pet_name", :with => "monster")
    click_button('meet_pet')
    click_button('nap_pet')
    expect(page).to have_content("Your pet's sleep level: 12")
  end
end

# describe('kill Tamagotchi', {:type => :feature}) do
#   it ("kills the Tamagotchi when he hasn't been fed, played with, or napped often enough.") do
#     visit('/')
#     fill_in("pet_name", :with => "monster")
#     click_button('meet_pet')
#     # ??? not sure how to pause testing to allow the pet to die????
# end
