require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  
  before do
    ActionMailer::Base.deliveries.clear
  end

  let(:user) { FactoryBot.create(:user) }

  it "password resets" do
    get new_password_reset_path
    expect(response).to have_http_status(:success)
    assert_select 'input[name=?]', 'password_reset[email]'
    post password_resets_path, params: { password_reset: { email: "" } }
    expect(flash[:danger]).to eq "Email address not found"
    expect(response).to have_http_status(:success)
    post password_resets_path,
         params: { password_reset: { email: user.email } }
    expect(user.reset_digest).not_to eq user.reload.reset_digest
    expect(ActionMailer::Base.deliveries.size).to eq 1
    expect(flash[:info]).to eq "Email sent with password reset instructions"
    expect(response).to redirect_to root_url
    user.create_reset_digest
    get edit_password_reset_path(user.reset_token, email: "")
    expect(response).to redirect_to root_url
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    expect(response).to redirect_to root_url
    user.toggle!(:activated)
    get edit_password_reset_path('wrong token', email: user.email)
    expect(response).to redirect_to root_url
    get edit_password_reset_path(user.reset_token, email: user.email)
    expect(response).to have_http_status(:success)
    assert_select "input[name=email][type=hidden][value=?]", user.email
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password:              "foobaz",
                            password_confirmation: "barquux" } }
    assert_select 'div#error_explanation'
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password:              "",
                            password_confirmation: "" } }
    assert_select 'div#error_explanation'
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password:              "foobaz",
                            password_confirmation: "foobaz" } }
    expect(is_logged_in?).to be_truthy
    expect(flash[:success]).to eq "Password has been reset."
    expect(response).to redirect_to user_path(user)
  end

end
