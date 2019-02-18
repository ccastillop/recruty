require "application_system_test_case"

class ChoicesTest < ApplicationSystemTestCase
  setup do
    @choice = choices(:one)
  end

  test "visiting the index" do
    visit choices_url
    assert_selector "h1", text: "Choices"
  end

  test "creating a Choice" do
    visit choices_url
    click_on "New Choice"

    fill_in "Body", with: @choice.body
    fill_in "Question", with: @choice.question_id
    fill_in "score", with: @choice.score
    click_on "Create Choice"

    assert_text "Choice was successfully created"
    click_on "Back"
  end

  test "updating a Choice" do
    visit choices_url
    click_on "Edit", match: :first

    fill_in "Body", with: @choice.body
    fill_in "Question", with: @choice.question_id
    fill_in "score", with: @choice.score
    click_on "Update Choice"

    assert_text "Choice was successfully updated"
    click_on "Back"
  end

  test "destroying a Choice" do
    visit choices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Choice was successfully destroyed"
  end
end
