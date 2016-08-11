class Comment < ActiveRecord::Base
	belongs_to :tweets
end
