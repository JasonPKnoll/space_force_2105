require 'spacecraft'

class Flotilla
  attr_reader :name, :personnel, :ships

  def initialize(attributes)
    @name = attributes[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def add_personnel(person)
    @personnel << person
  end

  def recommend_personnel(spacecraft)
    recommend = []
    # ship require > person specialty > if statement

    ship.requirements.each do |requirement|

    end
    # people = @personnel.each do |person|
    #    person.specialties  == spacecraft.requirements  #[:astrophysics, :quantum_mechanics]
    #  end
    # spacecraft.requirements   # [{:astrophysics=>6}, {:quantum_mechanics=>3}]
    # require "pry"; binding.pry
  end

  def personnel_by_ship
  end
end
