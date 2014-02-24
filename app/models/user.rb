class User < ActiveRecord::Base

	before_save { self.email = email.downcase }
	#validates will cause save to db to fail when name is not present here
	#can see user.errors.full_messages to see "Name can't be blank"
	#or other error messages 
	#Rails actually validates with blank? method here
	validates :name, presence: true, length: { maximum: 50 }

	#ruby constants start with capital letter
	# see rubular.com for ruby regex understanding and about halfway down ch6
	#of railstutorial.org

	#regex below
	#basically says a string must have at least one character or - or .
	#followed by @ followed by at least one letter, digit, or - or .
	#followed by a literal dot (\.) followed by at least one letter
	#/i at end means it is not case sensitive
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	#Note on uniqueness. Doesn't ensure uniqueness in case where user
	#clicks twice on a button, sending two database requests that
	#are both validated before either is saved to the database
	#Solution is to check validation on database side too via index

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
			  uniqueness: { case_sensitive: false }

	#Note: has_secure_password validates for presence of password
	#and presence of confirmation password
	#has_secure_password adds password and password_confirmation attributes,
	#requires that they match and have presence, and adds an authenticate
	#method to compare encrypted password with password_digest
	has_secure_password
	validates :password, length: { minimum: 6 }
end
