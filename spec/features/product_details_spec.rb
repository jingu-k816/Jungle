require 'rails_helper'

RSpec.feature "Users can navigate from the home page to the product detail page", type: :feature do
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

  scenario "Clicks on the product to visit the detail page" do
    #ACT
    visit root_path
    first('article footer a.pull-right').click

    sleep 1
    save_screenshot

    expect(page).to have_css 'article.product-detail'
    
  end
end
