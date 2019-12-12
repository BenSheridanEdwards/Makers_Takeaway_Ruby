class Order

  def initialize
    @basket = Hash.new(0)
    @is_complete = false
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
  
  def checkout(amount = 0)
    raise "Error: No payment amount given, please confirm your payment amount" if no_amount_given(amount)
    raise "Error: Incorrect payment amount given, please confirm your payment amount and try again" if wrong_amount_given(amount)
    @is_complete = true 
    "Thank you, your order has been confirmed"
  end

  private

  def total
    @basket.reduce(0) { |total, (dish, quantity)| total + dish.price * quantity }
  end

  def no_amount_given(amount)
    amount == 0
  end

  def wrong_amount_given(amount)
    amount != total
  end
end