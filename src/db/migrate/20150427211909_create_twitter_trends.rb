class CreateTwitterTrends < ActiveRecord::Migration
  def change
  	create_table :twitter_trends do |t|
  		t.string :name
  		t.string :query
  		t.string :url
  		t.boolean :promoted_content
  		t.timestamp :tw_api_created_at
  		t.timestamps null: false
  	end
  end
end
