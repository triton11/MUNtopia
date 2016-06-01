class ResolutionsUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :resolution
end
