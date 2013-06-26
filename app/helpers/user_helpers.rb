def is_signed_in?
  session[:user_id] == nil ? false : true
end
