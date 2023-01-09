class CreateProductivities < ActiveRecord::Migration[7.0]
  def change
    create_table :productivities do |t|
      t.integer :level
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
