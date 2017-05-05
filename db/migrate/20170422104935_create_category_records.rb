class CreateCategoryRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :category_records do |t|
      t.integer :user_id
      t.integer :category_id
      t.timestamp :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
