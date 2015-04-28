module Topik
	module DB
		class Location < ActiveRecord::Base
			belongs_to :twitter_trends
		end
	end
end
