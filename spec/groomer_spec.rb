require './lib/pet.rb'
require './lib/customer.rb'
require './lib/groomer.rb'

RSpec.describe Groomer do
    before(:each) do
        @groomer = Groomer.new("The Great Groomer")
        @joel = Customer.new("Joel", 2)
        @harriet = Customer.new("Harriet", 3)
        @samson = Pet.new({name: "Samson", type: :dog, age: 3})
        @lucy = Pet.new({name: "Lucy", type: :cat, age: 12})
        @sally = Pet.new({name: "Sally", type: :dog, age: 4})
        @ellie = Pet.new({name: "Ellie", type: :dog, age: 1})

    end

    it 'exists' do
        expect(@groomer).to be_instance_of(Groomer)
    end

    it 'has a name' do
        expect(@groomer.name).to eq("The Great Groomer")
    end

    it 'has no customer by default' do
        expect(@groomer.customers).to eq([])
    end

    it 'can add customers' do
        @groomer.add_customer(@joel)

        expect(@groomer.customers).to eq([@joel])
    end

    it 'can have multiple customers' do
        @groomer.add_customer(@joel)
        @groomer.add_customer(@harriet)

        expect(@groomer.customers).to eq([@joel, @harriet])
    end

    it 'can have multiple customers with multiple pets' do
        @groomer.add_customer(@joel)
        @groomer.add_customer(@harriet)
        @joel.adopt(@samson)
        @harriet.adopt(@lucy)
        @harriet.adopt(@sally)
        @harriet.adopt(@ellie)

        expect(@groomer.customers[0].pets.count).to eq(1)
        expect(@groomer.customers[1].pets.count).to eq(3)
    end

    it 'can find customers with an outstanding balance' do
        @groomer.add_customer(@joel)
        @groomer.add_customer(@harriet)
        @joel.charge(100)

        expect(@groomer.find_customers_with_outstanding_bal).to eq([@joel])
    end

    it 'can count customer\'s pets by type' do
        @groomer.add_customer(@joel)
        @groomer.add_customer(@harriet)
        @joel.adopt(@samson)
        @harriet.adopt(@lucy)
        @harriet.adopt(@sally)
        @harriet.adopt(@ellie)

        expect(@groomer.count_customer_pets(:dog)).to eq(3)
        expect(@groomer.count_customer_pets(:cat)).to eq(1)

    end

end













































# require './lib/groomer'
# require './lib/customer'
# require './lib/pet'
#
# RSpec.describe Groomer do
#   before(:each) do
#     @groomer = Groomer.new("The Hair Ball")
#   end
#
#   describe "Object" do
#     it "exists" do
#       expect(@groomer).to be_instance_of(Groomer)
#     end
#
#     it "has a name" do
#       expect(@groomer.name).to eq("The Hair Ball")
#     end
#
#     it "starts with no customers" do
#       expect(@groomer.customers).to eq([])
#     end
#   end
#
#   describe "Integrating with Customers" do
#     before(:each) do
#       @joel = Customer.new("Joel", 2)
#       @billy = Customer.new("Billy", 3)
#       @samson = Pet.new({name: "Samson", type: :dog})
#       @lucy = Pet.new({name: "Lucy", type: :cat})
#       @molly = Pet.new({name: "Molly", type: :cat})
#     end
#     it "can add customers" do
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.customers).to eq([@joel, @billy])
#     end
#
#     it "can count the number of pets of a certain type" do
#       @joel.adopt(@samson)
#       @joel.adopt(@lucy)
#       @billy.adopt(@molly)
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.number_of_pets(:cat)).to eq(2)
#     end
#
#     it "can list customers with outstanding balances" do
#       @joel.charge(10)
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.customers_with_oustanding_balances).to eq([@joel])
#     end
#   end
# end





























# RSpec.describe Groomer do

#   before(:each) do
#     @groomer = Groomer.new("The Hair Ball")
#   end

#   describe "Object" do
#     it "exists" do
#       expect(@groomer).to be_instance_of(Groomer)
#     end

#     it "has a name" do
#       expect(@groomer.name).to eq("The Hair Ball")
#     end

#     it "starts with no customers" do
#       expect(@groomer.customers).to eq([])
#     end
#   end

#   describe "Integrating with Customers" do
#     before(:each) do
#       @joel = Customer.new("Joel", 2)
#       @billy = Customer.new("Billy", 3)
#       @samson = Pet.new({name: "Samson", type: :dog})
#       @lucy = Pet.new({name: "Lucy", type: :cat})
#       @molly = Pet.new({name: "Molly", type: :cat})
#     end
#     it "can add customers" do
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.customers).to eq([@joel, @billy])
#     end

#     it "can count the number of pets of a certain type" do
#       @joel.adopt(@samson)
#       @joel.adopt(@lucy)
#       @billy.adopt(@molly)
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.number_of_pets(:cat)).to eq(2)
#     end

#     it "can list customers with outstanding balances" do
#       @joel.charge(10)
#       @groomer.add_customer(@joel)
#       @groomer.add_customer(@billy)
#       expect(@groomer.customers_with_oustanding_balances).to eq([@joel])
#     end
#   end
# end
