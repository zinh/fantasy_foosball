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
  belongs_to :match, counter_cache: true
  belongs_to :winning_team, class_name: 'Team'
  validates_inclusion_of :score, in: 0..10
  validates_presence_of :match_id, :winning_team_id, :score
  after_save :update_winning_team

  def update_winning_team
    team_id, winning_count = match.games.pluck(:winning_team_id)
      .each_with_object({}){|item, memo| memo[item] ||= 0; memo[item] += 1}.to_a
      .max_by(&:last)
    if team_id.present? && winning_count >= 2
      match.update_attribute(:winning_team_id, team_id)
    end
  end
end
