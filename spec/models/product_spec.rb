require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do 
      @product = Product.new(name: "albert", price_cents:3999, quantity: 2)
      @category = Category.new(name:"food")
      @product.category = @category
    end

    it "Name value is present" do
      expect(@product).to be_valid
    end

    it "if Name value is not present" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "if Price value is not present" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it "if Quantity value is not present" do
    @product.quantity = nil
    expect(@product).to_not be_valid
    end
    it "if Category value is not present" do
    @product.category = nil
    expect(@product).to_not be_valid
    end
    # validation tests/examples here
  end
end
