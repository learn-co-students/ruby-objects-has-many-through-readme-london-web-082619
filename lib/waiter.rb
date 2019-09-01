class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience 
        @@all << self 
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end

      #this method creates a new variable, best_tipped_meal, and sets it to = the result of en enumerated spaceship operator, <=>. meal_a and meal_b are simply part of the syntax (see your notes on useful enumerators) that allow comparison. An easy to understand example of this:
      #a = %w(albatross dog horse)
      #a.max                                   #=> "horse"
      #a.max { |a, b| a.length <=> b.length }  #=> "albatross"
      #you can see here that its a three element array - don't get hung up on there only being an |a, b| - its built as a comparison operator. 

end