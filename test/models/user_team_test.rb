# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTeamTest < ActiveSupport::TestCase
  test "should not save without user_id" do
    user_team = UserTeam.new(team_id: teams(:one).id)
    assert_not user_team.save, "Saved UserTeam without user_id"
  end

  test "should not save without team_id" do
    user_team = UserTeam.new(user_id: users(:one).id)
    assert_not user_team.save, "Saved UserTeam without team_id"
  end
end
