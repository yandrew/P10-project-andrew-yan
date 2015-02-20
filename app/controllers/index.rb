

get '/' do
	if logged_in?
		@user = User.find(session[:user_id])
		erb :profile
	else
		erb :index
	end
end

post '/' do
	api = Instagram::Client.new
	api.user_feed(params[:username])
end

get '/oauth/connect' do
	#sign_in
	redirect Instagram.authorize_url(redirect_uri: ENV['CALLBACK_URL'])
end

get '/sign_out' do
	session.clear
	redirect '/'
end

get '/oauth/callback' do
	@response_token = Instagram.get_access_token(params[:code], redirect_uri: ENV['CALLBACK_URL'])
	#check existing users
	username = @response_token.user.username
	
	user = User.find_by_username(username)
	if user
		user.update_attributes( :oauth_token => @response_token.access_token )
	else
		user = User.create(:username =>    username,
											 :profile_pic => @response_token.user.profile_picture, 
											 :full_name =>   @response_token.user.full_name,
											 :oauth_token => @response_token.access_token,
											 :ig_id =>       @response_token.user.id )
	end

	session_set_user_id(user)

	redirect '/profile'
end

get '/profile' do
	if logged_in?
		@user = User.find(session[:user_id])
		erb :profile
	else
		redirect '/'
	end
end


get "/users/feed" do
  @user = User.find(session[:user_id])
  @client = @user.client
  erb :feed
end

get "/location_search" do
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Search for a location by lat/lng with a radius of 5000m</h1>"
  for location in client.location_search("48.858844","2.294351","5000")
    html << "<li> #{location.name} <a href='https://www.google.com/maps/preview/@#{location.latitude},#{location.longitude},19z'>Map</a></li>"
  end
  html
end

post "/user_search" do
	@user = User.find(session[:user_id])
  @client = @user.client
  @name = params[:name]
  erb :search_user_results
end

get "/user_search" do
	@user = User.find(session[:user_id])
	erb :search_user
end

get "/users/search/feed" do
	@user = User.find(session[:user_id])	
	erb :search_user_feed
end

post "/users/search/feed" do
	redirect "/users/#{@other_user}/feed"
end

get "/users/:name/feed" do
	api = Instagram::Client.new
	@user = User.find(session[:user_id])
	@other_user = params[:name]
	@feed = api.username_feed(params[:name])
	# @feed['data'][0]['location']['latitude']
	@latlong = "#{@feed['data'][0]['location']['latitude']}, #{@feed['data'][0]['location']['longitude']}"
	erb :map
	# erb :user_feed
end
