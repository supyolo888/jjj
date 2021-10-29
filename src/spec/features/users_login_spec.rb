require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do

  before do
    @user = FactoryBot.create(:user)
  end
  
  scenario "login with valid email/invalid password" do
    visit login_path
    expect(page).to have_current_path "/login"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "invalid"
    click_button "Log in"
    #is_logged_in?
    expect(page).to have_current_path "/login"
    expect(page).to have_content("Invalid email/password combination")
    visit root_path
    expect(page).to_not have_content("Invalid email/password combination")
  end

  scenario "login with valid information followed by logout" do
    visit login_path
    expect(page).to have_current_path "/login"
    fill_in "Email", with: "michael@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    #is_logged_in?
    expect(page).to have_current_path "/users/#{@user.id}"
    expect(page).to_not have_css("a", text: "Log in")
    expect(page).to have_css("a", text: "Log out")
    expect(page).to have_css("a", text: "Profile")
    # click_button "Log out"
    # not is_logged_in?
    # expect(page).to have_current_path "/"
    # expect(page).to have_css("a", text: "Log in")
    # expect(page).to_not have_css("a", text: "Log out")
    # expect(page).to_not have_css("a", text: "Profile")
  end

end
