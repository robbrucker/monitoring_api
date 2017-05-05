class AddHasStopTimeToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :has_stop_time, :boolean
  end
end
