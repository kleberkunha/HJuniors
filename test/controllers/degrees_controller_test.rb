require "test_helper"

class DegreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @degree = degrees(:one)
  end

  test "should get index" do
    get degrees_url
    assert_response :success
  end

  test "should get new" do
    get new_degree_url
    assert_response :success
  end

  test "should create degree" do
    assert_difference("Degree.count") do
      post degrees_url, params: { degree: {  } }
    end

    assert_redirected_to degree_url(Degree.last)
  end

  test "should show degree" do
    get degree_url(@degree)
    assert_response :success
  end

  test "should get edit" do
    get edit_degree_url(@degree)
    assert_response :success
  end

  test "should update degree" do
    patch degree_url(@degree), params: { degree: {  } }
    assert_redirected_to degree_url(@degree)
  end

  test "should destroy degree" do
    assert_difference("Degree.count", -1) do
      delete degree_url(@degree)
    end

    assert_redirected_to degrees_url
  end
end
