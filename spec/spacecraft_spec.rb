require './lib/spacecraft'

describe Spacecraft do
  before(:each) do
    @daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
  end

  it 'Exists'  do
    expect(@daedalus).to be_a(Spacecraft)
  end

  it 'Has attributes' do
    expect(@daedalus.name).to eq('Daedalus')
    expect(@daedalus.fuel).to eq(400)
  end

end
