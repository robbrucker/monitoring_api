class CategoryRecordsController < ApiController
  before_action :set_category_record, only: [:show, :update, :destroy]
  before_action :require_login

  def index
    if params[:category_id] && params[:user_id]
      @category_records = CategoryRecord.where(:category_id => params[:category_id], :user_id => params[:user_id])
    else
      @category_records = nil
    end


    render json: @category_records.limit(30), methods: [:total_time]
  end

  def show
    render json: @category_record
  end

  def create
    @category_record = CategoryRecord.new(category_record_params)

    if @category_record.save
      render json: @category_record, status: :created, location: @category_record
    else
      render json: @category_record.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category_record.update(category_record_params)
      render json: @category_record
    else
      render json: @category_record.errors, status: :unprocessable_entity
    end
  end

  def last_details
    render :json => CategoryRecord.get_last_record_details(params)
  end

  # DELETE /category_records/1
  def destroy
    @category_record.destroy
    render json: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_record
      @category_record = CategoryRecord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_record_params
      params.require(:category_record).permit(:category_id, :user_id, :start_time, :end_time)
    end
end
