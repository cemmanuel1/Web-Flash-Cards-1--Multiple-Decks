get '/url/new' do
  @url = Url.new
  erb :url_form
end

post '/url/create' do
  @url = Url.new(params[:url])
  @url.user_id = current_user.id rescue nil
  if @url.valid?
    @url.save
    redirect "/"
  else
    erb :url_form
  end
end

get '/:short_url' do
  begin
    @url = Url.find_by_short_address(params[:short_url])
    @url.increment!(:click_count)
    redirect @url.address
  rescue
    redirect "http://www.youtube.com"
  end
end
