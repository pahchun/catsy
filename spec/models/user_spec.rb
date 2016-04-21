require 'rails_helper'

describe User do
  it "should have a valid email" do
    should have_valid(:email).when('abcd@gmail.com', 'dcba@mailg.com')
  end

  it " should reject invalid emails" do
    should_not have_valid(:email).
      when(
        nil,
        '',
        'abc',
        'usersba.com'
      )
  end

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
