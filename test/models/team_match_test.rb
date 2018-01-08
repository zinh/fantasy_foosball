# == Schema Information
#
# Table name: team_matches
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  match_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeamMatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
