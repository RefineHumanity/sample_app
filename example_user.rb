class User
	attr_accessor :name, :email

	#note: initialize is special in Ruby, called when 
	#Object.new is called

	#Also note that empty hashes are null, so instance vars
	#here are null 

	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end
