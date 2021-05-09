class CreateFashionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :fashion_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :fashion_id

      t.timestamps
    end
  end
end
