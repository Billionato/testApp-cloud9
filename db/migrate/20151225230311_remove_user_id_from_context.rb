class RemoveUserIdFromContext < ActiveRecord::Migration
  def change
    remove_column :contexts, :user_id, :integer
  end
end
