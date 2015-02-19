

get '/' do
	# if params[:code]
	# 	session[:code] = params[:code]
	# end
	# @CLIENT_ID = CLIENT_ID

	erb :index

end

post '/' do
	api = Instagram::Client.new
	api.user_feed(params[:username])
end

get '/oauth/connect' do
	#sign_in
	redirect Instagram.authorize_url(redirect_uri: ENV['CALLBACK_URL'])
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
	@user = User.find(session[:user_id])
	erb :profile
end



