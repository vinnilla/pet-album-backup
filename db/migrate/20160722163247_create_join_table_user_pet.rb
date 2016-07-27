class CreateJoinTableUserPet < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :pets do |t|
      # t.index [:user_id, :pet_id]
      # t.index [:pet_id, :user_id]
    end
  end
end
