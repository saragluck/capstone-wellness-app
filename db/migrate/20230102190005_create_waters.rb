class CreateWaters < ActiveRecord::Migration[7.0]
  def change
    create_table :waters do |t|
      t.time :time
      t.date :date
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
