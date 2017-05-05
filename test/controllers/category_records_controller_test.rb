require 'test_helper'

class CategoryRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_record = category_records(:one)
  end

  test "should get index" do
    get category_records_url, as: :json
    assert_response :success
  end

  test "should create category_record" do
    assert_difference('CategoryRecord.count') do
      post category_records_url, params: { category_record: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show category_record" do
    get category_record_url(@category_record), as: :json
    assert_response :success
  end

  test "should update category_record" do
    patch category_record_url(@category_record), params: { category_record: {  } }, as: :json
    assert_response 200
  end

  test "should destroy category_record" do
    assert_difference('CategoryRecord.count', -1) do
      delete category_record_url(@category_record), as: :json
    end

    assert_response 204
  end
end
