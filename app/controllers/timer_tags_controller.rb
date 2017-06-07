class TimerTagsController < ApplicationController
  before_action :set_timer_tag, only: [:show, :update, :destroy]

  # GET /timer_tags
  def index
    @timer_tags = TimerTag.all

    render json: @timer_tags
  end

  # GET /timer_tags/1
  def show
    render json: @timer_tag
  end

  # POST /timer_tags
  def create
    @timer_tag = TimerTag.new(timer_tag_params)

    if @timer_tag.save
      render json: @timer_tag, status: :created, location: @timer_tag
    else
      render json: @timer_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timer_tags/1
  def update
    if @timer_tag.update(timer_tag_params)
      render json: @timer_tag
    else
      render json: @timer_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timer_tags/1
  def destroy
    @timer_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timer_tag
      @timer_tag = TimerTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timer_tag_params
      params.require(:timer_tag).permit(:category_record_id, :tag_id, :user_id)
    end
end
