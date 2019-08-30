class Customer

    attr_accessor :name, :age, :waiter, :total, :tip

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

    def meals #Customer.meals
        Meal.all.select{ |meal| meal.customer == self }
    end

    def waiters #Customer.waiters
        meals.map{ |meal| meal.waiter }
    end

    # def waiters
    #     meals.map do |meal|
    #       meal.waiter
    #     end
    #   end

  
end