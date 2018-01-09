# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  match_id        :integer
#  winning_team_id :integer
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Game < ApplicationRecord
  belongs_to :match
  belongs_to :winning_team, class_name: 'Team'
  validates_inclusion_of :score, in: 0..10
  validates_presence_of :match_id, :winning_team_id, :score
end
