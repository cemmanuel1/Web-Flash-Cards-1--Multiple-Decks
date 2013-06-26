class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :address
      t.string :short_address
      t.integer :click_count, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
