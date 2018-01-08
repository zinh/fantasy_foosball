# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams

  has_many :team_matches
  has_many :matches, through: :team_matches

  validates_presence_of :name
end
