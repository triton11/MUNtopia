class Resolution < ActiveRecord::Base
	has_many :amendments
	has_many :resolutions_users
	has_many :users, through: :resolutions_users
end
