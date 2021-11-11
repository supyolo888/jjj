require 'rails_helper'
include ApplicationHelper

RSpec.describe "UsersProfiles", type: :request do

  let(:user) {FactoryBot.create(:user)}

  before do
    40.times {FactoryBot.create(:micropost, :microposts)}
  end

  it "profile display" do
    get user_path(user)
    expect(response).to have_http_status(200)
    assert_select "title", full_title(user.name)
    assert_select "h1", text: user.name
    assert_select "h1>img.gravatar"
    assert_match user.microposts.count.to_s, response.body
    #assert_select "div.pagination"
    user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
  
end
