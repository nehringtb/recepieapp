class Chef < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :chefname, presence: true, length:  {maximum: 30}
	VALID_EMAIL_REGEX = /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$\z/
	validates :email, presence: true,
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: {case_sensitive: false}
	validates :password, presence: true, 
		length: {minimum: 5}
	has_many :recipes
	has_secure_password
end
