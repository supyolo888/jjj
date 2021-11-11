require 'rails_helper'

RSpec.describe "Microposts", type: :request do

  let!(:micropost) { FactoryBot.create(:micropost) }
  let!(:user1) { FactoryBot.create(:user) }
  
  it "should redirect create when not logged in" do
    expect{
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    }.to_not change(Micropost, :count)
    expect(response).to redirect_to login_path
  end

  it "should redirect destroy when not logged in" do
    expect {
      delete micropost_path(micropost)
    }.to_not change(Micropost, :count)
    expect(response).to redirect_to login_path
  end

  it "should redirect destroy for wrong micropost" do
    log_in_as(user1)
    expect {
      delete micropost_path(micropost)
    }.to_not change(Micropost, :count)
    expect(response).to redirect_to root_path
  end

end
