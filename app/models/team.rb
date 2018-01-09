# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  matches_counter :integer          default(0)
#

class Team < ApplicationRecord
  MAX_MEMBER = 2
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  has_many :team_matches
  has_many :matches, through: :team_matches

  validates_presence_of :name
  accepts_nested_attributes_for :user_teams, reject_if: ->(user_team){ user_team[:user_id].blank? }

  validate :member_count_validator

  def member_count_validator
    errors.add(:base, 'Please select at least one user') if user_teams.size.zero?
  end
end
