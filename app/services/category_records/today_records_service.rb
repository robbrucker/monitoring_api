include ActionView::Helpers::DateHelper
module CategoryRecords
  class TodayRecordsService
    def initialize(params)
      @params = params
      midnightToday = Date.today.midnight
      midnightTomorrow = Date.tomorrow.midnight
      @records = CategoryRecord.where(:user_id => @params[:user_id], :category_id => @params[:category_id], :start_time => midnightToday..midnightTomorrow)
    end

    def get_all_records
     return @records
    end

    def get_total_time
      current_time = []
      @records.each do |val|
        if val[:start_time] && val[:end_time]
          current_time << TimeDifference.between(val[:end_time], val[:start_time]).in_seconds
        end
      end
      if current_time.length > 0
        return distance_of_time_in_words(current_time.inject(0){|sum,x| sum + x })
      else
        return nil
      end


    end

  end
end