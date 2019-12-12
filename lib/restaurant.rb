require_relative 'order'
require_relative 'messager'

class Restaurant
  
  DELIVERY_TIME = 3600 # 1 Hour

  def initialize(order = Order.new, messager = Messager.new)
    @order = order
    @messager = messager
  end

  def checkout(amount = 0)
    raise "Error: No payment amount given, please confirm your payment amount" if no_amount_given(amount)
    raise "Error: Incorrect payment amount given, please confirm your payment amount and try again" if wrong_amount_given(amount)
    "Thank you, your order has been accepted, your delivery time will be #{delivery_time}"
    @messager.send_text(delivery_time)
  end

  def total_amount
    "Your order's total: £#{@order.total}"
  end
  
  private

  def delivery_time
    (Time.now + DELIVERY_TIME).strftime("%k:%M")
  end
  
  def no_amount_given(amount)
    amount == 0
  end

  def wrong_amount_given(amount)
    amount != @order.total
  end
end