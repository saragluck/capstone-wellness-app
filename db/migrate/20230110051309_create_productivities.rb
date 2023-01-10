class CreateProductivities < ActiveRecord::Migration[7.0]
  def change
    create_table :productivities do |t|
      t.integer :level
      t.time :time
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
