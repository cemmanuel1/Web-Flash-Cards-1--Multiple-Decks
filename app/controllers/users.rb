get '/' do
  if logged_in?
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
  unless logged_in?
    @message = "Login you Bastard!"
    @decks = Deck.all
    erb :index
  else
    @user = current_user
    @decks = Deck.all
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
