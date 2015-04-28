module Topik
	module DB

		class TwitterTrend < ActiveRecord::Base
			has_one :locations
			
		end
	end
end