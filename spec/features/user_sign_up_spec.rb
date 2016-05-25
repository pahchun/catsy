require 'rails_helper'

feature "sign up", %{
  As an unauthentificated user
  I want to sign up
  so that I can buy and sell the items
} do

  #ACCEPTANCE CRITERIA
  #[ ] I must specify valid email address
  #[ ] I must specify a password and password confirmation
  #[ ] I get an error message, if I miss even one box
  #[ ] I can sign up succesfully if I provide all the valid informations

  let!(:user) do
    User.create(
      email: "pinkpinksopink@gmail.com",
      password: "123123"
    )
  end

  scenario 'user provides valid informations and sign up successfully' do
    visit new_user_registration_path
    fill_in 'Email', with: "helloworld@gmail.com"
    fill_in 'Password', with: "hellopassword"
    fill_in 'Password confirmation', with: "hellopassword"
    click_button 'Sign up'

    expect(page).to have_content("CATSY")
    expect(page).to have_content("Sign out")
  end

  scenario 'user enters the email that is already existing' do
    visit new_user_registration_path
    fill_in 'Email', with: "pinkpinksopink@gmail.com"
    fill_in 'Password', with: "123123"
    fill_in 'Password confirmation', with: "123123"
    click_button 'Sign up'

    expect(page).to have_content("1 error prohibited this user from
     being saved:")
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'user does not provide any information' do
    visit new_user_registration_path
    fill_in 'Email', with: ""
    fill_in 'Password', with: ""
    fill_in 'Password confirmation', with: ""
    click_button 'Sign up'

    expect(page).to have_content("2 errors prohibited this user from
     being saved:")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'user provides invalid information' do
    visit new_user_registration_path
    fill_in 'Email', with: "pinkpink@gmail.com"
    fill_in 'Password', with: "asdf"
    fill_in 'Password confirmation', with: "asdf"
    click_button 'Sign up'

    expect(page).to have_content("1 error prohibited this user from
     being saved:")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end
end
