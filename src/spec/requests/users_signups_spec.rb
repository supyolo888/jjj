require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do

  before do
    ActionMailer::Base.deliveries.clear
  end

  let(:user) { FactoryBot.attributes_for(:user) }
  let(:noactivateduser) { FactoryBot.create(:user, :noactivated) }


  it "valid signup information" do
    expect {
      post users_path, params: { user: user }
    }.to change(User, :count).by(1)
    expect(ActionMailer::Base.deliveries.size).to eq(1)
    expect(response).to redirect_to root_url
    expect(is_logged_in?).to be_falsy
  end

  it "valid signup information with account activation" do
    expect(noactivateduser).to_not be_activated
    log_in_as(noactivateduser)
    expect(is_logged_in?).to be_falsy
    get edit_account_activation_path("invalid token", email: noactivateduser.email)
    expect(is_logged_in?).to be_falsy
    get edit_account_activation_path(noactivateduser.activation_token, email: 'wrong')
    expect(is_logged_in?).to be_falsy
    get edit_account_activation_path(noactivateduser.activation_token, email: noactivateduser.email)
    assert noactivateduser.reload.activated?
    expect(noactivateduser).to be_activated
    expect(response).to redirect_to user_path(noactivateduser)
    expect(is_logged_in?).to be_truthy

  end

end