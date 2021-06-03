class Spacecraft
  attr_reader :name, :fuel

  def initialize(attributes)
    @name = attributes[:name]
    @fuel = attributes[:fuel]
  end

end
