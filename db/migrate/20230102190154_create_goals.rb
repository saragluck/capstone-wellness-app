class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :goal
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
