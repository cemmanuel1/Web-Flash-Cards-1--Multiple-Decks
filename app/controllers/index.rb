get '/' do
  if is_signed_in?
    redirect "/user/dashboard"
  else
    erb :index
  end
end

get "/user/new" do
  @user = User.new
  erb :user_form
end

get "/user/dashboard" do
  unless is_signed_in?
    @message = "Login you Bastard!"
    erb :index
  else
    @user = User.find(session[:user_id])
    erb :dashboard
  end
end

post "/user/create" do
  @user = User.new(params[:user])

  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect "/user/dashboard"
  else
    erb :user_form
  end
end

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
