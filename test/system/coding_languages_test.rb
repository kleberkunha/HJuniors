require "application_system_test_case"

class CodingLanguagesTest < ApplicationSystemTestCase
  setup { @coding_language = coding_languages(:one) }

  test "visiting the index" do
    visit coding_languages_url
    assert_selector "h1", text: "Coding languages"
  end

  test "should create coding language" do
    visit coding_languages_url
    click_on "New coding language"

    fill_in "Name", with: @coding_language.name
    fill_in "User", with: @coding_language.user_id
    click_on "Create Coding language"

    assert_text "Coding language was successfully created"
    click_on "Back"
  end

  test "should update Coding language" do
    visit coding_language_url(@coding_language)
    click_on "Edit this coding language", match: :first

    fill_in "Name", with: @coding_language.name
    fill_in "User", with: @coding_language.user_id
    click_on "Update Coding language"

    assert_text "Coding language was successfully updated"
    click_on "Back"
  end

  test "should destroy Coding language" do
    visit coding_language_url(@coding_language)
    click_on "Destroy this coding language", match: :first

    assert_text "Coding language was successfully destroyed"
  end
end
