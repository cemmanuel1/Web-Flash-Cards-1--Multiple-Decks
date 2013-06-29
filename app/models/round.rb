class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck
  has_many :guesses, :dependent => :destroy

  def number_correct
    self.guesses.where(is_correct: true).count 
  end

  def number_incorrect
    self.guesses.where(is_correct: false).count 
  end
end
