module CategoryRecords
  class GetTodaysRecordsService
    def self.init(params)
      if(params[:category_id] && params[:user_id])
        records = CategoryRecords::TodayRecordsService.new(params)
        ret_obj = {}
        ret_obj["all_records"] = records.get_all_records
        ret_obj["total_time"] = records.get_total_time
        return ret_obj
      end
    end
  end
end