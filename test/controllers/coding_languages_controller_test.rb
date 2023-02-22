require "test_helper"

class CodingLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coding_language = coding_languages(:one)
  end

  test "should get index" do
    get coding_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_coding_language_url
    assert_response :success
  end

  test "should create coding_language" do
    assert_difference("CodingLanguage.count") do
      post coding_languages_url, params: { coding_language: { name: @coding_language.name, user_id: @coding_language.user_id } }
    end

    assert_redirected_to coding_language_url(CodingLanguage.last)
  end

  test "should show coding_language" do
    get coding_language_url(@coding_language)
    assert_response :success
  end

  test "should get edit" do
    get edit_coding_language_url(@coding_language)
    assert_response :success
  end

  test "should update coding_language" do
    patch coding_language_url(@coding_language), params: { coding_language: { name: @coding_language.name, user_id: @coding_language.user_id } }
    assert_redirected_to coding_language_url(@coding_language)
  end

  test "should destroy coding_language" do
    assert_difference("CodingLanguage.count", -1) do
      delete coding_language_url(@coding_language)
    end

    assert_redirected_to coding_languages_url
  end
end
