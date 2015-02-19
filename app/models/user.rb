class User < ActiveRecord::Base
	validates :oauth_token, presence: true
	validates :username, presence: true

end
