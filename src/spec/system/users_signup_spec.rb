require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do

  it "invalid signup information" do
    visit root_path
    click_on "Sign up"
    expect {
      fill_in "Name", with: ""
      fill_in "Email", with: "user@invalid"
      fill_in "Password", with: "foo"
      fill_in "Confirmation", with: "bar"
      click_button "Create my account"
    }.to_not change(User, :count)
    expect(page).to have_current_path users_path
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

  it "valid signup information" do
    visit root_path
    click_on "Sign up"
    expect {
      fill_in "Name", with: "Example User"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirmation", with: "password"
      click_button "Create my account"
    }.to change(User, :count).by(1)
    # expect(page).to have_current_path user_path(User.last)
    # expect(page).to have_content("Welcome to the Sample App!")
  end

end
