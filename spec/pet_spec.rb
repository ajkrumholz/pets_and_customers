require './lib/pet'

RSpec.describe Pet do
  before(:each) do
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    require 'pry'; binding.pry
  end

  it 'has a name' do
    expect(@samson.name).to eq("Samson")
  end

  it 'has a type' do
    expect(@samson.type).to eq(:dog)
  end

  it 'has an age' do
    expect(@samson.age).to eq(3)
  end

  it 'is not fed by default' do
    expect(@samson.fed?).to eq(false)
  end

  it 'can be fed' do
    @samson.feed
    expect(@samson.fed?).to eq(true)
  end

end
