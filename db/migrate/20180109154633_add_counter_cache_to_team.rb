class AddCounterCacheToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :matches_counter, :integer, default: 0
  end
end
