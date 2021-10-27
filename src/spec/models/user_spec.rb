require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
      name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar"
    )
  end

  it "valid user" do
     expect(@user).to be_valid
  end

  it "name empty" do
    @user.name = ""
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "email empty" do
    @user.name = ""
    @user.valid?
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "name too long" do
    @user.name = "a"*51
    @user.valid?
    expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it "email too long" do
    @user.email = "a" * 244 + "@example.com"
    @user.valid?
    expect(@user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "email valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it "email invalid" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end
  end

  it "is unique user" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    duplicate_user.valid?
    expect(duplicate_user.errors[:email]).to include("has already been taken")
  end

  it "password empty" do
    @user.password = @user.password_confirmation = " " * 6
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end

  it "password too short" do
    @user.password = @user.password_confirmation = "a" * 5
    @user.valid?
    expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

end