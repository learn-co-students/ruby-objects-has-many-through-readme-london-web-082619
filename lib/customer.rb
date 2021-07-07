#Create class Customer and initialize name and age.
#Create an @@all and set up empty array, so you can push whatever you need to inside opf this array.
class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
    #Each costumer instanve has a name an age. Their name and age are set upon initialization, and because I create
    #attribute accessor for both, the costumer can change their name and age
    def self.all
        @@all
      end
      #I don't need to pass costumer as argument because I'm using self as a reference to the current instance of
      #customer.This method will allow to create new meals as a customer, and automatically associate each new
      #meal with the customer that created it
      def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
      end

      #The customer is going to look at all meals and he can select only the ones that belongs to them.
      #So I iterate through every instance of meal and return only the ones where the meal's customer matches 
      #the current customer instance.
      def meals
        Meal.all.select do |meal| meal.customer == self
        end
    end

    def waiters
        meals.map do |meal|
          meal.waiter
        end
      end

    
    end