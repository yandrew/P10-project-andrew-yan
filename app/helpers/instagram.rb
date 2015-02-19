require 'httparty'
require 'json'



module Instagram
	class Client
		include HTTParty
		base_uri 'https://api.instagram.com'

		def initialize
		end

		def search_user(username)
			options = { query: { q: username, client_id: CLIENT_ID } }
			
			response = self.class.get('/v1/users/search', options)
			return response
		end

		def user_feed(user_id)
			options = { query: { client_id: CLIENT_ID } }
			response = self.class.get("/v1/users/#{user_id}/media/recent/", options)
			return response
		end

		def username_feed(username)
			id = search_user(username)['data'][0]['id']
			feed = user_feed(id)			
			return feed
		end


	end




end



# api = Instagram::Client.new

# result = api.search_user("yandrew84")
# id = result['data'][0]['id']

# feed = api.user_feed("144350655")
# p feed
# feed = api.username_feed("yandrew84")

# p last_photo = feed['data'][0]['images']['low_resolution']['url']