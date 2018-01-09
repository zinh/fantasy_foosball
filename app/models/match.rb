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
  accepts_nested_attributes_for :team_matches, reject_if: ->(team_match){ team_match[:team_id].blank? }

  validate :team_count_validator

  def team_count_validator
    errors.add(:base, "Please select two teams") if team_matches.size != 2
  end
end
