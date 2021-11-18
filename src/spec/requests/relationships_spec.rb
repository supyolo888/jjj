require 'rails_helper'

RSpec.describe "Relationships", type: :request do

  let(:user) { FactoryBot.create(:user) }
  let(:other) { FactoryBot.create(:user) }
  let!(:relationship) {Relationship.create(follower_id: user.id,followed_id: other.id)}
  
  it "create should require logged-in user" do
    expect{
      post relationships_path
    }.to_not change(Relationship, :count)
    expect(response).to redirect_to login_path
  end

  it "destroy should require logged-in user" do
    expect{
      delete relationship_path(relationship)
    }.to_not change(Relationship, :count)
    expect(response).to redirect_to login_path
  end

end
