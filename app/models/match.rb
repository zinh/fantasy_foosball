# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  winning_team_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Match < ApplicationRecord
  has_many :games
  has_many :team_matches
  has_many :teams, through: :team_matches
end
