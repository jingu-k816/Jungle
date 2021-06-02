require 'rails_helper'

RSpec.feature "Users can click the 'Add to Cart' button for a product", type: :feature do
    # SET UP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  
    scenario "Clicks add button to add item to the cart" do
      #ACT
      visit root_path
      first('article footer .button_to').click
      
      #DEBUG
      save_screenshot

      #VERIFY
      expect(page).to have_content 'My Cart (1)'
      
    end
end
