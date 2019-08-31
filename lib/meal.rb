class Meal
    @@all = []

    attr_accessor :total, :tip 
    attr_reader :waiter, :customer
    def initialize(waiter, customer, total, tip)
        @waiter = waiter 
        @customer = customer 
        @total = total 
        @tip = tip 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

end