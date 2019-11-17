require "application_system_test_case"

class DiariesTest < ApplicationSystemTestCase
  setup do
    @diary = diaries(:one)
  end

  test "visiting the index" do
    visit diaries_url
    assert_selector "h1", text: "Diaries"
  end

  test "creating a Diary" do
    visit diaries_url
    click_on "New Diary"

    fill_in "Awaken times", with: @diary.awaken_times
    fill_in "Bedtime", with: @diary.bedtime
    fill_in "Date", with: @diary.date
    fill_in "Feeling", with: @diary.feeling
    fill_in "Liquor num", with: @diary.liquor_num
    fill_in "Liquor type", with: @diary.liquor_type
    fill_in "Naptime", with: @diary.naptime
    fill_in "Sleep quality", with: @diary.sleep_quality
    fill_in "Time beforesleep", with: @diary.time_beforesleep
    fill_in "User", with: @diary.user_id
    fill_in "Wakeuptime", with: @diary.wakeuptime
    fill_in "Week", with: @diary.week
    click_on "Create Diary"

    assert_text "Diary was successfully created"
    click_on "Back"
  end

  test "updating a Diary" do
    visit diaries_url
    click_on "Edit", match: :first

    fill_in "Awaken times", with: @diary.awaken_times
    fill_in "Bedtime", with: @diary.bedtime
    fill_in "Date", with: @diary.date
    fill_in "Feeling", with: @diary.feeling
    fill_in "Liquor num", with: @diary.liquor_num
    fill_in "Liquor type", with: @diary.liquor_type
    fill_in "Naptime", with: @diary.naptime
    fill_in "Sleep quality", with: @diary.sleep_quality
    fill_in "Time beforesleep", with: @diary.time_beforesleep
    fill_in "User", with: @diary.user_id
    fill_in "Wakeuptime", with: @diary.wakeuptime
    fill_in "Week", with: @diary.week
    click_on "Update Diary"

    assert_text "Diary was successfully updated"
    click_on "Back"
  end

  test "destroying a Diary" do
    visit diaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diary was successfully destroyed"
  end
end
