require 'order'

RSpec.describe Order do

  let(:order) { Order.new }
  let(:chicken_katsu_curry) { double :dish, name: "Chicken Katsu Curry", price: 6 }
  let(:sweet_sour_chicken) { double :dish, name: "Sweet & Sour Chicken", price: 6}

  it "should initialize with an empty basket" do
    expect(order.show_basket).to eq ""
  end

  describe '#show_basket' do
    it "should return each dish's name and quantity that is in the basket" do
      order.add(chicken_katsu_curry, 1)
      expect(order.show_basket).to include("Chicken Katsu Curry")
      expect(order.show_basket).to include("1")
    end

    it "should increase the quantity shown in the basket when the same dish is ordered multiple times" do
      order.add(chicken_katsu_curry, 1)
      order.add(chicken_katsu_curry, 1)
      expect(order.show_basket).to include("Chicken Katsu Curry")
      expect(order.show_basket).to include("2")
    end

    it "should be able to add more than one different type of dish to the basket" do
      order.add(chicken_katsu_curry, 1)
      order.add(sweet_sour_chicken, 1)
      expect(order.show_basket).to include("Chicken Katsu Curry")
      expect(order.show_basket).to include("Sweet & Sour Chicken")
    end
  end

  describe '#add' do
    it "should confirm each dish and quantity that has been added to the basket" do
      expect(order.add(chicken_katsu_curry, 1)).to eq ("1 Chicken Katsu Curry's have been added to your basket")
    end
  end

  describe '#total_cost' do
    it "should return the order's total cost" do
      order.add(chicken_katsu_curry, 1)
      order.add(sweet_sour_chicken, 1)
      expect(order.total_cost).to eq "Your order's total: £12"
    end
  end

  context "when a customer adds items to their basket" do
    it "should confirm confirm each item as it's added to their basket" do
      expect(order.add(sweet_sour_chicken, 2)).to eq "2 Sweet & Sour Chicken's have been added to your basket"
    end

    it "should show their current basket when requested" do
      order.add(sweet_sour_chicken, 2)
      expect(order.show_basket).to eq "2x Sweet & Sour Chicken = £12"
    end

    it "should show their current basket's cost when requested" do
      order.add(sweet_sour_chicken, 2)
      expect(order.total_cost).to eq "Your order's total: £12"
    end
  end

  context "when a customer wants to checkout with their current order" do
    before(:each) do
      order.add(sweet_sour_chicken, 2)
    end
    
    it "should raise an error if the customer fails to enter their payment amount upon checkout" do
      message = "Error: No payment amount given, please confirm your payment amount"
      expect{ order.checkout() }.to raise_error message
    end

    it "should raise an error if the customer fails to checkout with the correct payment amount" do
      message = "Error: Incorrect payment amount given, please confirm your payment amount and try again"
      expect{ order.checkout(10) }.to raise_error message
    end

    it "should return the total cost of the order" do
      expect(order.total_cost).to eq "Your order's total: £12"
    end

    it "should confirm their order has been submited when the correct payment amount is given" do
      expect(order.checkout(12)).to eq "Thank you, your order has been confirmed"
    end
  end
end