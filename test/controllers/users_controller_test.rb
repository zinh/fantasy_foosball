require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_path(@user), params: { user: { first_name: 'Updated' } }
    @user.reload
    assert_equal "Updated", @user.first_name
  end
end
