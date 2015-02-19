# require 'httparty'
# require 'json'
# require 'pry'


# my_id = 144350655

# response = HTTParty.get("https://api.instagram.com/v1/users/search?q=vineeeeeeeet&client_id=#{CLIENT_ID}")

# # puts response.to_json

# my_recent_posts = HTTParty.get("https://api.instagram.com/v1/users/#{my_id}/media/recent/?client_id=#{CLIENT_ID}")

# # puts my_recent_posts.to_json

# "https://api.instagram.com/v1/users/144350655/media/recent/?client_id=cae89f9a719446e89aff6712ffeb26df"

# vineet = 225740215

# vinny_posts = HTTParty.get("https://api.instagram.com/v1/users/225740215/media/recent/?client_id=cae89f9a719446e89aff6712ffeb26df")
# vinny_post_data = vinny_posts['data'][0]
# # puts vinny_posts.to_json
# lat = vinny_post_data['location']['latitude']
# long = vinny_post_data['location']['longitude']

# location = "#{lat}, #{long}"
# puts location
# puts "-------------------message -------------------"
# puts vinny_posts.body
# puts "-------------------code-------------------"
# puts vinny_posts.code
# puts "-------------------message -------------------" 
# puts vinny_posts.message
# puts "-------------------headers inspect -------------------"
# puts vinny_posts.headers.inspect

# CLIENT_ID="cae89f9a719446e89aff6712ffeb26df"
# CLIENT_SECRET="375a67d9d69848c8a84db6affa1f5368"

# module Instagram
# 	class Client
# 		include HTTParty
# 		base_uri 'https://api.instagram.com'

# 		def initialize
# 		end

# 		def search_user(username)
# 			options = { query: { q: username, client_id: CLIENT_ID } }
			
# 			response = self.class.get('/v1/users/search', options)
# 			return response
# 		end

# 		def user_feed(user_id)
# 			options = { query: { client_id: CLIENT_ID } }
# 			response = self.class.get("/v1/users/#{user_id}/media/recent/", options)
# 			return response
# 		end

# 	end
# end


# api = Instagram::Client.new

# result = api.search_user("yandrew84")
# id = result['data'][0]['id']

# feed = api.user_feed("144350655")
# p feed
# p last_photo = feed['data'][0]['images']['low_resolution']['url']


# p result








