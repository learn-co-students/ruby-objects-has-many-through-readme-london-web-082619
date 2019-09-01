require "pry"

require_relative "meal.rb"
require_relative "customer.rb"

class Waiter

    attr_accessor :name, :experience

    @@all = []

    def initialize (name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|m_ins| m_ins.waiter == self}
    end

    def all_tips
        Meal.all.map{|m_ins| m_ins.tip}
    end

    def best_tipper
        Meal.all.find{|m| m.tip == all_tips.max}.customer
    end

end
