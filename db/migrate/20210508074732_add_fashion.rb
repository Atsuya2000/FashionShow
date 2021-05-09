class AddFashion < ActiveRecord::Migration[5.2]
  def change
    add_column :fashions, :user_id, :integer
  end
end
