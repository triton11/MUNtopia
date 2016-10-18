class User < ActiveRecord::Base
	include BCrypt
	has_many :statuses
	has_many :resolutions_users
	has_many :resolutions, through: :resolutions_users
	validates :name, confirmation: true
	validates :name_confirmation, presence: true, on: :create
	validates :password_hash, length: { minimum: 6 }, confirmation: true
	validates :password_hash_confirmation, presence: true, on: :create
	validates :password_hash, uniqueness: { case_sensitive: false }


	def name_capitalized
		unless /^[A-Z]/.match(name)
			errors.add(:name, 'name is not capitalized')
		end
	end

	def password
    	unless password_hash == nil 
        password ||= Password.new(password_hash)
      end
  	end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
