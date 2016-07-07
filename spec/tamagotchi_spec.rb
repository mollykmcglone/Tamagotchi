require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe("#initialize") do
    it("names the new Tamagotchi and set the initial life levels") do
      my_pet = Tamagotchi.new("sparky")
      expect(my_pet.name()).to(eq("sparky"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive?") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("sparky")
      expect(my_pet.is_alive?()).to(eq(true))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.time_passes(10)
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe("#feed") do
    it("increases food level by 2") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.feed()
      expect(my_pet.food_level()).to(eq(12))
    end
  end

  describe("#play") do
    it("increases activity level by 2") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.play()
      expect(my_pet.activity_level()).to(eq(12))
    end
  end

  describe("#rest") do
    it("increases sleep level by 2") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.rest()
      expect(my_pet.sleep_level()).to(eq(12))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1 for each minute since the last action taken") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.time_passes(1)
      expect(my_pet.food_level()).to(eq(9))
    end
    it("decreases the activity level the Tamagotchi has by 2 for each minute since the last action taken") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.time_passes(1)
      expect(my_pet.activity_level()).to(eq(8))
    end
    it("decreases the sleep level the Tamagotchi has by 3 for each minute since the last action taken") do
      my_pet = Tamagotchi.new("sparky")
      my_pet.time_passes(1)
      expect(my_pet.sleep_level()).to(eq(7))
    end
  end
end
