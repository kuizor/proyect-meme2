class User < ActiveRecord::Base
	has_many :memes
	has_many :email_details
	has_many :emails, through: :email_details 

	before_create :default

	private
	def default
		self.type_user = "USER"
	end
end
