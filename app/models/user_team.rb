# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # validates_presence_of :user_id, :team_id
end
