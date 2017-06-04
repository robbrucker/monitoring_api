class CategoryTagsController < ApplicationController
  before_action :set_category_record_tag, only: [:show, :update, :destroy]

  # GET /category_record_tags
  def index
    @category_tags = CategoryTag.all

    render json: Tag.where(:id => CategoryTag.all.select(:tag_id))
  end

  # GET /category_record_tags/1
  def show
    render json: @category_tag
  end

  def fuzzy_search

  end

  # POST /category_record_tags
  def create
    @category_tag = CategoryTag.new(category_tag_params)

    if @category_tag.save
      render json: @category_tag, status: :created, location: @category_tag
    else
      render json: @category_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category_record_tags/1
  def update
    if @category_tag.update(category_record_tag_params)
      render json: @category_tag
    else
      render json: @category_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category_record_tags/1
  def destroy
    @category_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_record_tag
      @category_tag = CategoryTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def category_tag_params
    params.require(:category_tag).permit(:category_id, :tag_id, :user_id)
  end
end
