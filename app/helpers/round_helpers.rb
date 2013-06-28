helpers do
  def get_unseen_cards  
    seen_cards = current_user.rounds.map {|round| round.guesses.where(is_correct: true).map {|guess| guess.card.id}}.flatten
    Card.where('id NOT IN (?)',seen_cards << -1)
  end
end