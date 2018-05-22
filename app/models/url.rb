class Url < ApplicationRecord
	
	def self.expired url
		((Time.now-url.created_at)/60) > 5
	end

end
