require 'rails_helper'

RSpec.describe "UsersSessions", type: :request do

  let(:user) {FactoryBot.create(:user)}

  it "log in and log out" do
    post login_path, params: { session: {
      email: user.email,
      password: user.password,
    } }
    expect(response).to redirect_to user_path(user)
    expect(is_logged_in?).to be_truthy 
    delete logout_path
    expect(response).to redirect_to root_path
    expect(is_logged_in?).to be_falsey
    delete logout_path
    expect(response).to redirect_to root_path
    expect(is_logged_in?).to be_falsey
  end

  it "login with remembering" do
    log_in_as(user, remember_me: "1")
    expect(cookies[:remember_token]).not_to eq ""
  end

  it "login without remembering" do
    log_in_as(user, remember_me: "1")
    expect(cookies[:remember_token]).not_to eq ""
    delete logout_path
    log_in_as(user, remember_me: '0')
    expect(cookies[:remember_token]).to eq ""
  end

end