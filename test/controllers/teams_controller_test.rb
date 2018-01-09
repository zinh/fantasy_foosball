require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should get index" do
    get teams_url
    assert_response :success
  end

  test "should get new" do
    get new_team_url
    assert_response :success
  end

  # test "should update team" do
  #   patch team_path(@team), params: { team: { name: 'New name' }}
  #   @team.reload
  #   assert_equal 'New name', @team.name
  # end
end
