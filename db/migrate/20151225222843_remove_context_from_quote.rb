class RemoveContextFromQuote < ActiveRecord::Migration
  def change
    remove_column :quotes, :context, :text
  end
end
