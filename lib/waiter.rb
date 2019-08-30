require_relative './customer.rb'
require_relative './meal.rb'

class Waiter

    @@all = []

    attr_accessor :name, :year

    def initialize(name, year)
        @name = name
        @year = year
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total ,tip)
    end

    def meals
        Meal.all.find_all{|meal| meal.waiter == self}
    end

    def best_tipper
        meals.max_by{|meal| meal.tip}.customer
    end

end