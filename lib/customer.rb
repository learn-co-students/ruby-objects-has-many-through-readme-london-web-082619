
##class makes you build Customer.new instance 
## name and age is initialized so you can create Milen = Milen.new(Milen, 30)
class Customer
    attr_accessor :name , :age
    @@all = []  #class variable #something to store , tracking every customer or know about ever customer.
  def initialize (name, age)
    @name = name
    @age = age 
    @@all << self

end

    def self.all 
    @@all 
    end

        def new_meal ( waiter, total, tip = 0)
        Meal.new(waiter,self,total,tip )
        end

        def meals 
            Meal.all.select do |meal|  #Mchecking for customer 
                meal.customer == self
            end
         end
         
         def waiters
            meals.map do |meal|  #meals method above 
                meal.waiter 
            end
            end

            
        end