class CategoryRecord < ApplicationRecord
  belongs_to :category
  attr_accessor :total_time
  default_scope { order(id: :desc) }
  def total_time
    if end_time && start_time
      return TimeDifference.between(start_time, end_time).humanize
    end
  end
  def category_name
    return category.category_name
  end

  def self.get_last_record_details(params)
    return CategoryRecords::GetLastRecordsForCategoryService.init(params)
  end
end
