require 'rails_helper'

RSpec.describe "UsersLogins", type: :system do
  
  let(:user) {FactoryBot.create(:user)}
  
  it "login with valid email/invalid password" do
    visit login_path
    expect(page).to have_current_path login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "invalid"
    click_button "Log in"
    #is_logged_in?
    expect(page).to have_current_path login_path
    expect(page).to have_content("Invalid email/password combination")
    visit root_path
    expect(page).to_not have_content("Invalid email/password combination")
  end

  it "login with valid information followed by logout" do
    visit login_path
    expect(page).to have_current_path login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    #is_logged_in?
    expect(page).to have_current_path user_path(user)
    expect(page).to_not have_link href: login_path
    expect(page).to have_link href: logout_path
    expect(page).to have_link href: user_path(user)
    visit root_path
    click_on "Log out"
    expect(page).to have_current_path root_path
    expect(page).to have_link href: login_path
    expect(page).to_not have_link href: logout_path
    expect(page).to_not have_link href: user_path(user)
  end

end
