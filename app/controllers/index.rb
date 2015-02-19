get '/' do
	@CLIENT_ID = CLIENT_ID
	erb :index

end

post '/' do
	api = Instagram::Client.new
	api.search_user(yandrew84)
end

