require "application_system_test_case"

class ContextsTest < ApplicationSystemTestCase
  setup do
    @context = contexts(:one)
  end

  test "visiting the index" do
    visit contexts_url
    assert_selector "h1", text: "Contexts"
  end

  test "should create context" do
    visit contexts_url
    click_on "New context"

    fill_in "Industry description", with: @context.industry_description
    fill_in "Landing page url", with: @context.landing_page_url
    fill_in "Name", with: @context.name
    fill_in "Tiktok ad account", with: @context.tiktok_ad_account_id
    fill_in "Tiktok adgroup", with: @context.tiktok_adgroup_id
    fill_in "Tiktok campaign", with: @context.tiktok_campaign_id
    click_on "Create Context"

    assert_text "Context was successfully created"
    click_on "Back"
  end

  test "should update Context" do
    visit context_url(@context)
    click_on "Edit this context", match: :first

    fill_in "Industry description", with: @context.industry_description
    fill_in "Landing page url", with: @context.landing_page_url
    fill_in "Name", with: @context.name
    fill_in "Tiktok ad account", with: @context.tiktok_ad_account_id
    fill_in "Tiktok adgroup", with: @context.tiktok_adgroup_id
    fill_in "Tiktok campaign", with: @context.tiktok_campaign_id
    click_on "Update Context"

    assert_text "Context was successfully updated"
    click_on "Back"
  end

  test "should destroy Context" do
    visit context_url(@context)
    click_on "Destroy this context", match: :first

    assert_text "Context was successfully destroyed"
  end
end
