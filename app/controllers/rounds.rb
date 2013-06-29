post '/round/play' do
  @round = Round.create(user_id: current_user.id, deck_id: params[:deck_id])
  redirect "/round/#{@round.id}/flipcard"
end

get '/round/:round_id/flipcard' do
  @round = Round.find(params[:round_id])
  @card = get_unseen_card(@round)
  p "CARD BELOW"
  p @card
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
  erb :round_results
end

# Click on play

# Create New Round

# loop --> until no more cards. Or exit.
#   Show him a card (Ensure its not seen by him before)
#   ask for an answer
