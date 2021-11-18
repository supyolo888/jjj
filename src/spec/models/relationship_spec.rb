require 'rails_helper'

RSpec.describe Relationship, type: :model do
  
  let(:user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let(:relationship) { Relationship.new(follower_id: user.id,followed_id: other.id) }

  it "should be valid" do
    expect(relationship).to be_valid
  end

  it "should require a follower_id" do
    relationship.follower_id = nil
    expect(relationship).to be_invalid
  end

  it "should require a followed_id" do
    relationship.followed_id = nil
    expect(relationship).to be_invalid
  end

end
