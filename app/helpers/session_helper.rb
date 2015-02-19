helpers do

	def session_set_user_id(user)
		session[:user_id] = user.id
	end

	def logged_in?
		!!session[:user_id]
	end

end

helpers