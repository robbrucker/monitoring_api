class ChangeCategoryRecordToCategoryId < ActiveRecord::Migration[5.0]
  def change
    rename_column :category_record_tags, :category_record_id, :category_id
  end
end
