class Order

  def initialize
    @basket = Hash.new(0)
    @complete = false
  end

  def show_basket
    @basket.map do |dish, quantity|
      "#{quantity}x #{dish.name} = £#{dish.price * quantity}"
      end.join(", ")
  end

  def add(dish, quantity = 1)
    @basket[dish] += quantity
    "#{quantity} #{dish.name}'s have been added to your basket"
  end

  def total_cost
    "Your order's total: £#{total}"
  end
  
  def confirmed
    @complete = true
  end

  def complete?
    @complete
  end

  private

  def total
    @basket.reduce(0) { |total, (dish, quantity)| total + dish.price * quantity }
  end

end