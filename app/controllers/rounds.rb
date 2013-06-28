post '/round/play' do
  @round = Round.create(user_id: current_user.id, deck_id: params[:deck_id])
  redirect "/round/get_card/#{@round.id}"
end

get '/round/flipcard/:round_id' do
  @cards = find_unseen_cards
end

# Click on play

# Create New Round

# loop --> until no more cards. Or exit.
#   Show him a card (Ensure its not seen by him before)
#   ask for an answer