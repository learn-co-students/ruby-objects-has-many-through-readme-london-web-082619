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

    def meals
        Meal.all.select do |meal|
          meal.customer == self
        end
    end
    #an iterator method that returns an array of all the meals (by accessing the @@all array of Meal class) that have a .customer association for self (customer that method is called on). The difference between using .map and .select here is:
    #.select  takes a block and creates a new array of the items the block evaluates to true only.
    #.map aka .collect  takes a block and creates a new array with all the items modified by the block. ** Map and Collect are exactly the same.

    def waiters 
        meals.map do |meal|
            meal.waiter 
        end
    end
    #since we have a method, meals, that returns an array of meals associated with the self instance of customer, we can iterate over each of those to return an array (.map) of waiters associated with that all the meals for that customer. 



  end
  