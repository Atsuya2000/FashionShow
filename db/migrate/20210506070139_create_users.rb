class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_id
      t.string :introduction
      t.string :password
      t.string :follow
      t.string :follower
      t.string :is_deleted
      t.string :boolean

      t.timestamps
    end
  end
end
