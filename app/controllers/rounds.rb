post '/round/play' do
  @round = Round.create(user_id: current_user.id, deck_id: params[:deck_id])
  redirect "/round/#{@round.id}/flipcard"
end

get '/round/:round_id/flipcard' do
  @round = Round.find(params[:round_id])
  @card = get_unseen_card(@round)
  redirect "/round/#{@round.id}/results" unless @card
  @guess = Guess.new
  erb :show_card
end

post '/round/:round_id/card/:card_id/submit' do
  card = Card.find(params[:card_id])
  is_correct = params[:guess].downcase == card.answer.downcase
  guess = Guess.create(card_id: card.id, round_id:  params[:round_id], 
    is_correct: is_correct, answer: params[:guess])
  redirect "/round/#{params[:round_id]}/flipcard"
end

get '/round/:round_id/results' do
  @round = Round.find(params[:round_id])
  redirect "/" if @round.guesses.empty?
  erb :round_results
end

get '/round/:round_id/delete' do
  @round = Round.find(params[:round_id])
  @round.guesses.delete_all
  @round.delete
  redirect "/"
end
