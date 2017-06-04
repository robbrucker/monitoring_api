class ChangeCategoryRecordTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :category_record_tags, :category_tags
  end
end
