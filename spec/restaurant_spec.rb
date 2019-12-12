require 'restaurant'

RSpec.describe Restaurant do

  let(:restaurant) { Restaurant.new }
  let(:chicken_katsu_curry) { double :dish, name: "Chicken Katsu Curry", price: 6 }
  let(:order) { double :order, basket: chicken_katsu_curry, total: 6}
  let(:restaurant_with_order) { Restaurant.new(order) }

  context "when a customer wants to checkout" do
    
    it "should raise an error if the customer fails to enter their payment amount upon checkout" do
      message = "Error: No payment amount given, please confirm your payment amount"
      expect{ restaurant_with_order.checkout() }.to raise_error message
    end

    it "should raise an error if the customer fails to checkout with the correct payment amount" do
      message = "Error: Incorrect payment amount given, please confirm your payment amount and try again"
      expect{ restaurant_with_order.checkout(10) }.to raise_error message
    end

    it "should return the total cost of the order" do
      expect(restaurant_with_order.total_amount).to eq "Your order's total: £6"
    end

    it "should confirm their order has been submited when the correct payment amount is given" do
      expect(restaurant_with_order.checkout(6)).to eq "Thank you, your order has been accepted, your delivery time will be #{(Time.now + 3600).strftime("%k:%M")}"
    end
  end
end