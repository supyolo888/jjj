require 'rails_helper'

RSpec.describe "UsersEdits", type: :system do

  let(:user) {FactoryBot.create(:user)}

  it "unsuccessful edit" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "Setting"
    expect(page).to have_current_path edit_user_path(user)
    fill_in "Name", with: ""
    fill_in "Email", with: "user@invalid"
    fill_in "Password", with: "foo"
    fill_in "Confirmation", with: "bar"
    click_on "Save changes"
    expect(page).to have_current_path user_path(user)
  end

  it "successful edit" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    click_on "Setting"
    expect(page).to have_current_path edit_user_path(user)
    fill_in "Name", with: "Foo Bar"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: ""
    fill_in "Confirmation", with: ""
    click_on "Save changes"
    expect(page).to have_content("Profile updated")
    expect(page).to have_current_path user_path(user)
    user.reload
    expect(user.name).to eq "Foo Bar"
    expect(user.email).to eq "foo@bar.com"
  end

  it "successful edit with friendly forwarding" do
    visit edit_user_path(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_current_path edit_user_path(user)
    fill_in "Name", with: "Foo Bar"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Password", with: ""
    fill_in "Confirmation", with: ""
    click_on "Save changes"
    expect(page).to have_content("Profile updated")
    expect(page).to have_current_path user_path(user)
    user.reload
    expect(user.name).to eq "Foo Bar"
    expect(user.email).to eq "foo@bar.com"
  end

end