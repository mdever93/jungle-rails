require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do
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

  scenario "users can navigate from the home page to the product detail page" do
    visit root_path
    page.first(:link, 'Details').click
    expect(page).to have_css 'section.products-show'
    # save_and_open_screenshot
  end
end
