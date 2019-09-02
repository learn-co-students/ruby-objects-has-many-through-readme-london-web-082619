class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end
    #Each instance of the 'waiter' class has a name and an attribute
    #describing their years of experience. 
    #Just loke 'Customer' class, the 'waiter' class has a class variable
    #that stores every 'waiter' instance upon initialization.

    def self.all
        @@all
    end
    
    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
    Meal.all.select do |meal|
      meal.waiter == self #checking for waiter now
    end
end
#Just like the customer, the waiter needs a way to get all the meals
#they have served. We'll create a #meals method again, with a subtle change.

def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
  
    best_tipped_meal.customer
  end
  #Here we found the best tipper, I wrote a method #best_tipper
  #I got the array from #meals, then rerurn the customer os meal with
  #the highest tip
end