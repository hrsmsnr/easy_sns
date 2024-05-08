class CreatePostDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :post_details do |t|
      t.integer :post_id,              null: false
      t.integer :sequence_number,              null: false
      t.text :body,              null: false

      t.timestamps
    end
  end
end
