require 'menu'

RSpec.describe Menu do

  let(:menu) { Menu.new }
  let(:dish1) { Dish.new("Chicken Katsu Curry", 6) }
  let(:dish2) { Dish.new("Sweet & Sour Chicken", 6) }
  
  describe '#list' do
    it "should initialize with an empty list of dishes" do
      expect(menu.list).to eq ""
    end

    context "when dishes are on the menu, and the user requests the menu" do
      before(:each) do
        menu.add(dish1)
        menu.add(dish2)
      end 
 
      it "should return the menu list, with each dish's name" do
        expect(menu.list).to include (dish1.name)
        expect(menu.list).to include (dish2.name)
      end

      it "should return the menu list, with each dish's price" do
        expect(menu.list).to include (dish1.price.to_s)
        expect(menu.list).to include (dish2.price.to_s)
      end
    end
  end

  describe '#add' do
    it 'should add a dish to the menu list when passed as an argument' do
      menu.add(dish1)
      expect(menu.list).to include (dish1.name)
    end

    it 'should raise an error if the dish is already on the menu' do
      menu.add(dish1)
      message = "Input dish unsuccessful. Chicken Katsu Curry is already on the menu"
      expect{ menu.add(dish1) }.to raise_error message
    end
  end
end 