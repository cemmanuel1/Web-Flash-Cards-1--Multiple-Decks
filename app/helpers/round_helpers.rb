helpers do
  def get_unseen_card(round)
    id = (round.deck.cards.pluck(:id) - round.guesses.pluck(:card_id)).sample
    return nil if id.blank?
    Card.find(id)
  end
end