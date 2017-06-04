class CategoryTag < ApplicationRecord
  belongs_to :tag

  def tag
    Tag.find(tag_id)
  end
end
