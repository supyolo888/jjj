require 'rails_helper'

RSpec.describe "Followings", type: :request do
  
  let(:user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:other2) { FactoryBot.create(:user) }
  let(:other3) { FactoryBot.create(:user) }

  before do
    log_in_as(user)
    user.follow(other2)
    user.follow(other3)
    other2.follow(user)
    other.follow(user)
  end

  it "following page" do
    get following_user_path(user)
    expect(user.following.empty?).to be_falsy
    assert_match user.following.count.to_s, response.body
    user.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  it "followers page" do
    get followers_user_path(user)
    expect(user.followers.empty?).to be_falsy
    assert_match user.followers.count.to_s, response.body
    user.followers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  it "should follow a user the standard way" do
    expect{
      post relationships_path, params: { followed_id: other.id }
    }.to change(user.following, :count).by(1)
  end

  it "should follow a user with Ajax" do
    expect{
      post relationships_path, xhr: true, params: { followed_id: other.id }
    }.to change(user.following, :count).by(1)
  end

  it "should unfollow a user the standard way" do
    user.follow(other)
    relationship = user.active_relationships.find_by(followed_id: other.id)
    expect{
      delete relationship_path(relationship)
    }.to change(user.following, :count).by(-1)
  end

  it "should unfollow a user with Ajax" do
    user.follow(other)
    relationship = user.active_relationships.find_by(followed_id: other.id)
    expect{
      delete relationship_path(relationship), xhr: true
    }.to change(user.following, :count).by(-1)
  end

end
