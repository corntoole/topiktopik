class AddTrendsRefToLocations < ActiveRecord::Migration
  def change
  	add_column :twitter_trends, :location_id, :integer
  	add_foreign_key :twitter_trends, :locations
  end
end
