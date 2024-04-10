require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.new
    subject {
      Product.new(
        id: 1,
        description: "Hello, Earth!",
        name: "Gum Tree",
        price: 6.99,
        quantity: 3,
        category: @category
      )
    }
    it "is not valid if no name" do
      @category = Category.new
      @product = Product.new(
        id: 2,
        description: "Hello, Earth!",
        name: nil,
        price: 6.99,
        quantity: 3,
        category: @category
      )
      expect(@product).not_to be_valid
    end

    it "is not valid if no price" do
      @category = Category.new
      @product = Product.new(
        id: 2,
        description: "Hello, Earth!",
        name: "Gum Tree",
        price: nil,
        quantity: 3,
        category: @category
      )
      expect(@product).not_to be_valid
    end

    it "is not valid if no quantity" do
      @category = Category.new
      @product = Product.new(
        id: 4,
        description: "Hello, Earth!",
        name: 'Gum Tree',
        price: 6.99,
        quantity: nil,
        category: @category
      )
      expect(@product).not_to be_valid
    end

    it "is not valid if no category" do
      @category = Category.new
      @product = Product.new(
        id: 5,
        description: "Hello, Earth!",
        name: 'Gum Tree',
        price: 6.99,
        quantity: 3,
        category: nil
      )
      expect(@product).not_to be_valid
    end

  end
end


# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created and then @product initialized with that category

# Create an initial example that ensures that a product with all four fields set will indeed save successfully

# Have one example for each validation, and for each of these:
#   Set all fields to a value but the validation field being tested to nil
#   Test that the expect error is found within the .errors.full_messages array

# You should therefore have five examples defined given that you have the four validations above
