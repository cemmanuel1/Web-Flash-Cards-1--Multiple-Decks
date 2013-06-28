class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.timestamps
    end

    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.integer :deck_id
      t.timestamps
    end

    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id 
      t.timestamps
    end

    create_table :guesses do |t|
      t.string :answer 
      t.integer :round_id
      t.integer :card_id
      t.boolean :is_correct
      t.timestamps
    end
  end
end
