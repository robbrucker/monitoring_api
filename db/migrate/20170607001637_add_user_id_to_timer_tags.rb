class AddUserIdToTimerTags < ActiveRecord::Migration[5.0]
  def change
    add_column :timer_tags, :user_id, :integer
  end
end
