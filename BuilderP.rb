class Pizza
  attr_accessor :dough, :sauce, :toppings

  def initialize(dough, sauce)
    @dough = dough
    @sauce = sauce
    @toppings = []
  end

  def add_topping(topping)
    @toppings << topping
  end

  def describe
    puts "This pizza has #{@dough} dough, #{@sauce} sauce, and the following toppings:"
    @toppings.each { |topping| puts "- #{topping}" }
  end
end

class PizzaBuilder
  def initialize
    @pizza = Pizza.new("", "")
  end

  def add_dough(dough)
    @pizza.dough = dough
  end

  def add_sauce(sauce)
    @pizza.sauce = sauce
  end

  def add_topping(topping)
    @pizza.add_topping(topping)
  end

  def pizza
    return @pizza
  end
end

class PepperoniPizzaBuilder < PizzaBuilder
  def add_dough
    @pizza.dough = "regular"
  end

  def add_sauce
    @pizza.sauce = "tomato"
  end

  def add_toppings
    @pizza.add_topping("pepperoni")
    @pizza.add_topping("cheese")
  end
end

class VeggiePizzaBuilder < PizzaBuilder
  def add_dough
    @pizza.dough = "whole wheat"
  end

  def add_sauce
    @pizza.sauce = "pesto"
  end

  def add_toppings
    @pizza.add_topping("mushrooms")
    @pizza.add_topping("onions")
    @pizza.add_topping("peppers")
  end
end

class PizzaDirector
  def create_pizza(builder)
    builder.add_dough
    builder.add_sauce
    builder.add_toppings
    return builder.pizza
  end
end

director = PizzaDirector.new

pepperoni_builder = PepperoniPizzaBuilder.new
pepperoni_pizza = director.create_pizza(pepperoni_builder)
puts "Pepperoni pizza:"
pepperoni_pizza.describe

veggie_builder = VeggiePizzaBuilder.new
veggie_pizza = director.create_pizza(veggie_builder)
puts "Veggie pizza:"
veggie_pizza.describe
