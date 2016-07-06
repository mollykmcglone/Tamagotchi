require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  erb(:index)
end

post('/creature') do
 @@my_pet = Tamagotchi.new(params.fetch('name'))
  Tamagotchi.set_last_active()
  @food_level = @@my_pet.food_level()
  @sleep_level = @@my_pet.sleep_level()
  @activity_level = @@my_pet.activity_level()
  @name = @@my_pet.name()
  erb(:creature)
end

post('/feed') do
  @food_level = @@my_pet.feed()
  @sleep_level = @@my_pet.sleep_level()
  @activity_level = @@my_pet.activity_level()
  @name = @@my_pet.name()
  Tamagotchi.set_last_active()
  erb(:creature)
end

post('/rest') do
  @food_level = @@my_pet.food_level()
  @sleep_level = @@my_pet.rest()
  @activity_level = @@my_pet.activity_level()
  @name = @@my_pet.name()
  Tamagotchi.set_last_active()
  erb(:creature)

  post('/activity') do
    @food_level = @@my_pet.food_level()
    @sleep_level = @@my_pet.sleep_level()
    @activity_level = @@my_pet.activity()
    @name = @@my_pet.name()
    Tamagotchi.set_last_active()
    erb(:creature)
