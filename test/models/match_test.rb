# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  winning_team_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  games_count     :integer          default(0)
#

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
