require 'rails_helper'

feature "User sees index page", %{
  As a user or as a visitor,
  I want to see index page of the site
  so that I can browse what is on the site
} do

  # ACCEPTANCE CRITERIA
  #[ ] I must be able to see navigation bar
  #[ ] I must see name of the website
  #[ ] I must see search
  #[ ] I must see list of items that can be bought
  #[ ] I must see the name and price of each item

  let!(:item1) do
    Item.create(
      name: "Catnip",
      price: "5.99"
    )
  end

  let!(:item2) do
    Item.create(
      name: "L-lysine for Cats",
      price: "27.50",
      description: "Buy this now and keep your cat healthy!"
    )
  end

  scenario "user visits index page" do
    visit root_path

    expect(page).to have_content("CATSY")
    expect(page).to have_content("Made for Cat Lovers")
    expect(page).to have_content("Catsy is a market place where cat lovers make the products")
  end

  scenario "user visits index page, and sees list of items with price" do
    visit items_path

    expect(page).to have_content("CATSY")
    expect(page).to have_link item1.name
    expect(page).to have_content item1.price
    expect(page).to_not have_content item2.description
  end

  scenario "User visits '/items', sees page numbers for additional items", :vcr do
    15.times do
      Item.create(
        name: "Cat bed",
        price: "39.99"
      )
    end

    visit items_path
    expect(page).to have_link("2")
    expect(page).to have_link("3")
    expect(page).to have_link("Next")
  end
end
