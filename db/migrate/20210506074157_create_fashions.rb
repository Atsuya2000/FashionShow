class CreateFashions < ActiveRecord::Migration[5.2]
  def change
    create_table :fashions do |t|
      t.string :name
      t.text :introduction

      t.timestamps
    end
  end
end
