class CreateFashionImages < ActiveRecord::Migration[5.2]
  def change
    create_table :fashion_images do |t|
      t.integer :fashion_id
      t.string :image_id

      t.timestamps
    end
  end
end
