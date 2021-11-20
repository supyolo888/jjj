require 'rails_helper'

RSpec.describe "MicropostsInterface", type: :request do

  let!(:user) { FactoryBot.create(:user) }
  let!(:user1) { FactoryBot.create(:user) }

  before do
    40.times do
      user.microposts.create(content: Faker::Lorem.sentence(word_count: 5))
    end
  end

  it "micropost interface" do
    log_in_as(user)
    get root_path
    assert_select "div.pagination"
    expect{
      post microposts_path, params: { micropost: { content: "" } }
    }.to_not change(Micropost, :count)
    assert_select "div#error_explanation"
    assert_select "a[href=?]", "/?page=2"
    content = "This micropost really ties the room together"
    expect{
      post microposts_path, params: { micropost: { content: content } }
    }.to change(Micropost, :count).by(1)
    expect(response).to redirect_to root_path
    follow_redirect!
    #assert_match content, response.body
    assert_select "a", text: "delete"
    first_micropost = user.microposts.paginate(page: 1).first
    expect{
      delete micropost_path(first_micropost)
    }.to change(Micropost, :count).by(-1)
    get user_path(user1)
    assert_select "a", text: "delete", count:0
  end

end