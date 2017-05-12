module CategoryRecords
  class GetLastRecordsForCategoryService
    def self.init(params)
      last_record_array = []
      if params[:user_id]
        categories = Category.where(:user_id => params[:user_id])

        categories.each do |category|
          record = CategoryRecord.where(:category_id => category.id, :user_id => params[:user_id]).order('id desc').first
          last_record = {}
          last_record["category_name"] = category.name
          if record
            last_record["start_time"] = record.start_time
            last_record["end_time"] = record.end_time
            last_record["total_time"] = record.total_time
          end
          last_record_array << last_record
        end
      end
      return last_record_array

    end
  end
end