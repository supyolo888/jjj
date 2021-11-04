require 'rails_helper'

RSpec.describe "Users", type: :request do

  before do
  @user = FactoryBot.create(:user)
  @noadmin_user = FactoryBot.create(:user, :noadmin)
  end

  it "returns http success" do
    get signup_path
    expect(response).to have_http_status(:success)
  end

  it "should redirect index when not logged in" do
    get users_path
    expect(response).to redirect_to login_path
  end

  it "should redirect edit when not logged in" do
    get edit_user_path(@user)
    expect(flash[:danger]).to eq "Please log in."
    expect(response).to redirect_to login_url
  end

  it "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
    email: @user.email } }
    expect(flash[:danger]).to eq "Please log in."
    expect(response).to redirect_to login_url
  end

  it "should redirect edit when logged in as wrong user" do
    log_in_as(@noadmin_user)
    get edit_user_path(@user)
    expect(flash[:danger]).to eq nil
    expect(response).to redirect_to root_url
  end

  it "should redirect update when logged in as wrong user" do
    log_in_as(@noadmin_user)
    patch user_path(@user), params: { user: { name: @user.name,
    email: @user.email } }
    expect(flash[:danger]).to eq nil
    expect(response).to redirect_to root_url
  end

  it"should redirect destroy when not logged in" do
    expect {
      delete user_path(@user)
    }.to_not change(User, :count)
    expect(response).to redirect_to login_url
  end

  it "should redirect destroy when logged in as a non-admin" do
    log_in_as(@noadmin_user)
    expect {
      delete user_path(@user)
    }.to_not change(User, :count)
    expect(response).to redirect_to root_url
  end

end
