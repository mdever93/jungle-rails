require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = Product.new(
        name: 'Test product',
        price: 5000,
        quantity: 10,
        category: @category
      )
    end
    it "saves a product successfully when all fields are set" do
      @product.save
      expect(@product.errors.full_messages).to be_empty
    end
    it "returns an error if name is blank" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "returns an error if price is blank" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "returns an error if quantity is blank" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "returns an error if category is blank" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
