require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end
end
