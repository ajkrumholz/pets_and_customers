class Groomer

    attr_reader :name,
                :customers

    def initialize(name)
        @name = name
        @customers = []
    end

    def add_customer(customer)
        @customers << customer
    end

    def find_customers_with_outstanding_bal
        @customers.select do |customer|
            customer.outstanding_balance > 0
        end
    end

    def count_customer_pets(pet_type)
        pets = @customers.map do |customer| 
            customer.pets
        end.flatten
        pets.count do |pet| 
            pet.type == pet_type
        end
    end
end



































# class Groomer
#   attr_reader :name,
#               :customers

#   def initialize(name)
#     @name = name
#     @customers = []
#   end

#   def add_customer(customer)
#     @customers << customer
#   end

#   def customers_with_oustanding_balances
#     @customers.find_all do |customer|
#       customer.outstanding_balance != 0
#     end
#   end

#   def number_of_pets(type)
#     pets = @customers.map { |customer| customer.pets }
#     end.flatten
#     pets.count do |pet|
#       pet.type == type
#     end
#   end
# end
