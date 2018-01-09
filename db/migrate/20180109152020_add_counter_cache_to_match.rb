class AddCounterCacheToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :games_count, :integer, default: 0
  end
end
