require './lib/person'

describe Person do
  before(:each) do
    @kathy = Person.new('Kathy Chan', 10)
  end

  it 'Exists'  do
    expect(@kathy).to be_a(Person)
  end

  it 'Has attributes' do
    expect(@kathy.name).to eq('Kathy Chan')
    expect(@kathy.experience).to eq(10)
  end

  it 'Can Add specialty' do
    @kathy.add_specialty(:astrophysics)
    @kathy.add_specialty(:quantum_mechanics)
    expect(@kathy.specialties).to eq([:astrophysics, :quantum_mechanics])
  end
end
