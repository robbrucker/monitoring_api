class CreateTimerTags < ActiveRecord::Migration[5.0]
  def change
    create_table :timer_tags do |t|
      t.integer :category_record_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
