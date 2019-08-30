class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all()
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals()
        Meal.all.select { | meal | meal.waiter == self }
    end

    def best_tipper()
        best_tipped_meal = meals.max { | a, b | a.tip <=> b.tip }
        best_tipped_meal.customer
    end

    def worst_tipped_meal()
        meals.min { | a, b | a.tip <=> b.tip }
    end

    def most_frequent_customer()
        all_customers = meals().map { | meal | meal.customer }
        all_customers.max_by { | customer | all.customers.count(customer) }
    end

    def average_tips()
        tips = self.meals.map { | meal | meal.tip }
        tips.sum / tips.count
    end

    def self.most_experienced_average_tips()
        most_experienced = self.all.max_by { | waiter | waiter.yrs_experience }
        most_experienced.average_tips()
    end

    def self.least_experienced_average_tips()
        least_experienced = self.all.min_by { | waiter | waiter.yrs_experience }
        least_experienced.average_tips()
    end


end