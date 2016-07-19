class AddUserIdToAs < ActiveRecord::Migration[5.0]
  def change
    add_column :as, :user_id, :integer
    add_index :as, :user_id
  end
end
