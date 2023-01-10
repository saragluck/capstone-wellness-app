class DropProductivity < ActiveRecord::Migration[7.0]
  def change
    drop_table :productivities
  end
end
