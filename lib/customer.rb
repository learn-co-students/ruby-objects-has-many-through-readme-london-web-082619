require "pry"

require_relative "meal.rb"
require_relative "waiter.rb"

class Customer
  
    attr_accessor :name, :age

    @@all = []

    def initialize (name, age)
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
        Meal.all.select{|m_ins| m_ins.customer == self}
    end

    def waiters
        meals.map {|m| m.waiter}
    end

end
