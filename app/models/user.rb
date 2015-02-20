class User < ActiveRecord::Base
	validates :oauth_token, presence: true
	validates :username, presence: true

	def client
		@client ||= Instagram.client(:access_token => self.oauth_token)
	end 

end
