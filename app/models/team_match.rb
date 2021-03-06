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

class TeamMatch < ApplicationRecord
  belongs_to :team, counter_cache: :matches_counter
  belongs_to :match
  validates_presence_of :team_id
end
