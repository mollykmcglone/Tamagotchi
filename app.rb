require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  # @name = params.fetch("name")
  erb(:index)
end

get('/creature') do
  erb(:creature)
end

post('/creature') do
  @my_pet = Tamagotchi.new(params.fetch('pet_name'))
  Tamagotchi.set_last_active()
  @food_level = @my_pet.food_level()
  @sleep_level = @my_pet.sleep_level()
  @activity_level = @my_pet.activity_level()
  @name = @my_pet.name()
  @my_pet.save()
  erb(:creature)
end

post('/feed') do
  @my_pet = Tamagotchi.all[0]
  @my_pet.time_passes(Tamagotchi.minutes_elapsed())
  if @my_pet.is_alive?()
    @food_level = @my_pet.feed()
    @sleep_level = @my_pet.sleep_level()
    @activity_level = @my_pet.activity_level()
    @name = @my_pet.name()
    Tamagotchi.clear()
    Tamagotchi.set_last_active()
    @my_pet.save()
  else
    @name = @my_pet.dead()
  end
  erb(:creature)
end

post('/rest') do
  @my_pet = Tamagotchi.all[0]
  @my_pet.time_passes(Tamagotchi.minutes_elapsed())
  if @my_pet.is_alive?()
    @food_level = @my_pet.food_level()
    @sleep_level = @my_pet.rest()
    @activity_level = @my_pet.activity_level()
    @name = @my_pet.name()
    Tamagotchi.clear()
    Tamagotchi.set_last_active()
    @my_pet.save()
  else
    @name = @my_pet.dead()
  end
  erb(:creature)
  end

post('/activity') do
  @my_pet = Tamagotchi.all[0]
  @my_pet.time_passes(Tamagotchi.minutes_elapsed())
  if @my_pet.is_alive?()
    @food_level = @my_pet.food_level()
    @sleep_level = @my_pet.sleep_level()
    @activity_level = @my_pet.play()
    @name = @my_pet.name()
    Tamagotchi.clear()
    Tamagotchi.set_last_active()
    @my_pet.save()
  else
    @name = @my_pet.dead()
  end
  erb(:creature)
end
