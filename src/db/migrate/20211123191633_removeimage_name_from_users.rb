class RemoveimageNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :image_name, :string
  end
end
