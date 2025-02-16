require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

describe Spacecraft do
  before(:each) do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    @seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    @kathy = Person.new('Kathy Chan', 10)
    @polly = Person.new('Polly Parker', 8)
    @rover = Person.new('Rover Henriette', 1)
    @sampson = Person.new('Sampson Edwards', 7)
    @odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})
  end

  it 'Exists'  do
    expect(@seventh_flotilla).to be_a(Flotilla)
  end

  it 'Has attributes' do
    expect(@seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(@seventh_flotilla.personnel).to eq([])
    expect(@seventh_flotilla.ships).to eq([])
  end

  it 'Can add Ships' do
    @seventh_flotilla.add_ship(@daedalus)
    expect(@seventh_flotilla.ships).to eq([@daedalus])
  end

  it 'Can add personnel' do
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)
    expect(@seventh_flotilla.personnel).to eq([@kathy, @polly, @rover, @sampson])
  end

  it 'Can recommend personnel' do
    @seventh_flotilla.add_ship(@daedalus)
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)
    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    @polly.add_specialty(:operations)
    @polly.add_specialty(:maintenance)
    @rover.add_specialty(:operations)
    @rover.add_specialty(:maintenance)
    @sampson.add_specialty(:astrophysics)
    @sampson.add_specialty(:quantum_mechanics)
    @daedalus.add_requirement({astrophysics: 6})
    @daedalus.add_requirement({quantum_mechanics: 3})

    expect(@seventh_flotilla.recommend_personnel(@daedalus)).to eq([@kathy, @sampson])
  end

  xit 'Shows qualified personnel for ships' do
    @seventh_flotilla.add_ship(@daedalus)
    @seventh_flotilla.add_ship(@odyssey)
    @seventh_flotilla.add_personnel(@kathy)
    @seventh_flotilla.add_personnel(@polly)
    @seventh_flotilla.add_personnel(@rover)
    @seventh_flotilla.add_personnel(@sampson)
    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    @polly.add_specialty(:operations)
    @polly.add_specialty(:maintenance)
    @rover.add_specialty(:operations)
    @rover.add_specialty(:maintenance)
    @sampson.add_specialty(:astrophysics)
    @sampson.add_specialty(:quantum_mechanics)
    @daedalus.add_requirement({astrophysics: 6})
    @daedalus.add_requirement({quantum_mechanics: 3})
    @odyssey.add_requirement({operations: 6})
    @odyssey.add_requirement({maintenance: 3})

    expect(@seventh_flotilla.personnel_by_ship).to eq({@daedalus => [@kathy, @sampson], @odyssey => [@polly]})
  end

end
