class AddUserIdToCategoryTags < ActiveRecord::Migration[5.0]
  def change
    add_column :category_tags, :user_id, :integer
  end
end
