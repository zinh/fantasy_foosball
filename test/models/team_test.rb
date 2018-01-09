# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "should require name" do
    team = Team.new
    assert_not team.valid?, "should has name presence validation"
  end

  # test "should at least has 1 member" do
  #   team = Team.new(name: teams(:without_member).name)
  #   assert_not team.valid?, "team should has at least one member validation"
  # end
end
