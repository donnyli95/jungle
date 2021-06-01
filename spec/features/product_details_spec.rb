require 'rails_helper'

RSpec.feature "user can navigate from home page to the product detail page by clicking on a product", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end

      visit root_path
    end

    scenario "They see all products" do
      # ACT
      # puts page.html 
      click_on "Details", match: :first
  
      #DEBUG / VERIFY
      save_screenshot 'visit_product_detail.png'


      expect(page).to have_css 'article.product-detail'
    end
end
