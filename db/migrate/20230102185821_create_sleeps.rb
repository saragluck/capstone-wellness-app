class CreateSleeps < ActiveRecord::Migration[7.0]
  def change
    create_table :sleeps do |t|
      t.time :asleep
      t.time :awake
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
