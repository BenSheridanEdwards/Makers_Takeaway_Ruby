class Menu

  def initialize
    @dishes = []
  end

  def list
    @dishes.map { |dish| "#{dish.name}, £#{dish.price}" }.join(", \n ")
  end

  def add(dish)
    raise "Input dish unsuccessful. #{dish.name} is already on the menu" if on_menu?(dish)
    @dishes << dish
    "#{dish.name} has been added to the menu"
  end

private 

  def on_menu?(dish)
    return true if @dishes.include?(dish)
  end
end