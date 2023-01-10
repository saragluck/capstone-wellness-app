class AddUserIdToProductivity < ActiveRecord::Migration[7.0]
  def change
    add_column :productivities, :user_id, :integer
  end
end
