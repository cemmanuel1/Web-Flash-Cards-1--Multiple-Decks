helpers do
  def get_unseen_card(deck)
    id = (deck.cards.pluck(:id) - Guess.pluck(:card_id)).sample
    return nil if id.blank?
    Card.find(id)
  end
end