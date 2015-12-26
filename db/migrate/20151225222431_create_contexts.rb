class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.integer :quote_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
