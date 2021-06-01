require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully if all four fields are valid' do
      @category = Category.new(name:'hello')
      @category.save

      product = Product.new(name: 'Jean', price: 100, quantity: 1, category: @category)
      product.save

      expect(product).to be_valid
    end

    it 'should output error if no name given' do
      category = Category.new(name:'hello')
      category.save

      product = Product.new(price: 100, quantity: 1, category: category)
      product.save

      expect(product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should output error if no quantity given' do
      category = Category.new(name:'hello')
      category.save

      product = Product.new(price: 100, name: "Jean", category: category)
      product.save

      expect(product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'should output error if no price given' do
      category = Category.new(name:'hello')
      category.save

      product = Product.new(name: 'Jean', quantity: 1, category: category)
      product.save

      expect(product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'should output error if no category given' do
      product = Product.new(price: 100, quantity: 1, name: "Jean")
      product.save

      expect(product.errors.full_messages).to eq(["Category can't be blank"])
    end

  end
end
