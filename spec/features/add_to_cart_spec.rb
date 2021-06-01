require 'rails_helper'

RSpec.feature "users can click the 'Add to Cart' button for a product on the home page and in doing so their cart increases by one", type: :feature, js: true do
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
        click_on "Add", match: :first
    
        #DEBUG / VERIFY
  
        expect(page).to have_text 'My Cart (1)'

        save_screenshot 'shows_cart_change.png'
      end
end
