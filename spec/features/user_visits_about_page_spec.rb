require 'rails_helper'

feature "User sees about page", %{
  As a user or as a visitor,
  I want to see about page of the site
  so that I can get the site information
} do

  # ACCEPTANCE CRITERIA
  #[ ] I must click about link from root page
  #[ ] I must see information about site

  scenario 'user successfully visits about page' do
    visit root_path
    click_link "About"

    expect(page.current_path).to eq pages_about_path
    expect(page).to have_content("About Catsy")
  end
end
