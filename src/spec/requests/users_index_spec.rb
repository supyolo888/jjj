require 'rails_helper'

RSpec.describe "UsersIndex", type: :request do

  before do
    30.times {FactoryBot.create(:user, :users)}
    @admin_user = FactoryBot.create(:user)
    @noadmin_user = FactoryBot.create(:user, :noadmin)
  end

  it "index as admin including pagination and delete links" do
    log_in_as(@admin_user)
    get users_path
    expect(response).to have_http_status(200)
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: 'delete'
      unless user == @admin_user
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    expect {
      delete user_path(@noadmin_user)
    }.to change(User, :count).by(-1)
  end

  it "index as non-admin" do
    log_in_as(@noadmin_user)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

end
