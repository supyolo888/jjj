require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  it "should be valid" do
     expect(@user).to be_valid
  end

  it "name should be present" do
    @user.name = ""
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "email should be present" do
    @user.email = ""
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it "name should not be too long" do
    @user.name = "a"*51
    @user.valid?
    expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    @user.valid?
    expect(@user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
  end

  it "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    duplicate_user.valid?
    expect(duplicate_user.errors[:email]).to include("has already been taken")
  end

  it "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end

  it "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    @user.valid?
    expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "authenticated? should return false for a user with nil digest" do
    expect(@user.authenticated?(:remember, '')).to be_falsy
  end

  describe "relationships" do

    let(:michael) { FactoryBot.create(:user) }
    let(:archer) { FactoryBot.create(:user) }
    let(:lana) { FactoryBot.create(:user) }

    before do
      michael.follow(lana)
    end

    it "should follow and unfollow a user" do
      expect(michael.following?(archer)).to be_falsy
      michael.follow(archer)
      expect(michael.following?(archer)).to be_truthy
      expect(archer.followers.include?(michael)).to be_truthy
      michael.unfollow(archer)
      expect(michael.following?(archer)).to be_falsy
    end

    it "feed should have the right posts" do  
      lana.microposts.each do |post_following|
        expect(michael.feed.include?(post_following)).to be_truthy
      end
      michael.microposts.each do |post_self|
        expect(michael.feed.include?(post_self)).to be_truthy
      end
      archer.microposts.each do |post_unfollowed|
        expect(michael.feed.include?(post_unfollowed)).to be_falsy
      end
    end

  end

end