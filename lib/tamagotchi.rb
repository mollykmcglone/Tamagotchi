class Tamagotchi
  @@last_active = nil
  @@my_pets = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_singleton_method(:all) do
    @@my_pets
  end

  define_singleton_method(:clear) do
    @@my_pets = []
  end

  define_method(:save) do
    @@my_pets.unshift(self)
  end

  define_method(:is_alive?) do
    if @food_level > 0 && @activity_level > 0 && @sleep_level > 0
    true
    else
    false
    end
  end

  define_method(:dead) do
    return "DEAD!"
  end

  define_method(:feed) do
    @food_level += 2
  end

  define_method(:play) do
    @activity_level += 2
  end

  define_method(:rest) do
    @sleep_level += 2
  end

  define_singleton_method(:set_last_active) do
    @@last_active = Time.now.to_i
  end

  define_singleton_method(:minutes_elapsed) do
    now = Time.now.to_i
    (now - @@last_active)/60
  end

  define_method(:time_passes) do |minutes|
      @food_level -= (1 * minutes)
      @activity_level -= (2 * minutes)
      @sleep_level -= (3 * minutes)
  end
end
