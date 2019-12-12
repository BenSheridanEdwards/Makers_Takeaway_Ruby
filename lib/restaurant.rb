class Restaurant

  def initialize(order = Order.new)
    @order = order
  end

  def view_order
    @order.map do |dish, quantity|
      "#{quantity}x #{dish.name} = £#{dish.price * quantity}"
      end.join(", ")
      @order.total
      "If you're happy with your order, please call .submit_order passing your order total above as confirmation"
  end

end