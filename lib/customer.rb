class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end
    #Here I dont need to take the 'customer' as argument because
    #I'm passing 'self' as reference to the current instance of customer
    #this method will create new meal's as a 'customer', and automattically
    #associate each new 'meal' with the 'customer' that create it.

    def meals
        Meal.all.select do |meal|
          meal.customer == self
    end
end
#Here I iterate through every instance of 'Meal' and returning only the 
#ones where the meal's 'customer' matches the current 'custome'
#instance. If a customer want to know about all of her meals, all
#we need to do is call the #meals method on the her customer instance

def waiters
    meals.map do |meal|
        meal.waiter
    end
end
#Each meal is associated with a waiter, so to get every waiter
#for every meal Rachel has had, we need to take the array of all
#os Rachel's meals, map over it, getting the waiter from it those
#meals.
    
end