#Create a class Meal to connect with customer and waiter, this class should initialize waiter, customer,
#total and tip, but tip should ne =0
class Meal
  attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
    #Here it's going to give both the customer and waiter instances the hability to gel all the information
    #about the meal that hey need without having to store it themself.
end