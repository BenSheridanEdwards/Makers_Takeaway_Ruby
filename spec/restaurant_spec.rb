require 'restaurant'

RSpec.describe Restaurant do

  let(:restaurant) { Restaurant.new }
  let(:order) { double :order, empty?: false, complete: "Thank you for your order!"}

describe '#view' do
  it "should initialize with an empty order if no order is given" do
    expect(restaurant.view_order).to be empty
  end
end

describe '#submit_order' do
  it "should submit the order if the payment amount given is correct" do
    expect(restaurant.submit_order(20))
end

end