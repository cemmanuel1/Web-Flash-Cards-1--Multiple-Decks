post "/user/login" do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/user/dashboard"
  else
    @message = "Login Failed: Invalid Username or Password"
    erb :index
  end
end

get "/user/logout" do
  session[:user_id] = nil
  redirect "/"
end
