class Tamagotchi
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

  define_method(:is_alive?) do
    if @food_level > 0 && @activity_level > 0 && @sleep_level > 0
    true
    else
    false
    end
  end

  define_method(:set_food_level) do
    @food_level -= 1
  end

  define_method(:set_activity_level) do
    @activity_level -= 1
  end

  define_method(:set_sleep_level) do
    @sleep_level -= 1
  end

  define_method(:feed) do
    @food_level += 2
  end

  define_method(:activity) do
    @activity_level += 2
  end

  define_method(:rest) do
    @sleep_level += 2
  end

  define_method(:time_passes) do
    # now = Time.now
    # seconds = 60
    # later = (now.+seconds)
    # if now = later
      self.set_food_level()
      self.set_activity_level()
      self.set_sleep_level()
  end
end
