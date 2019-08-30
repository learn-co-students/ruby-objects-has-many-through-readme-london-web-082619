require_relative './meal.rb'
require_relative './waiter.rb'

class Customer

    @@all = []

    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.find_all{|meal| meal.customer == self}
    end

    def waiters
        meals.map{|meal| meal.waiter}
    end

end