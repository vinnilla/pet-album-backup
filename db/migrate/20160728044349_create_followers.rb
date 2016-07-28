class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
