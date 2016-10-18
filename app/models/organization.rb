class Organization < ActiveRecord::Base
	has_many :users
	validates :email, confirmation: true
	validates :email_confirmation, presence: true, on: :create
end
