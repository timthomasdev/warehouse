require "application_system_test_case"

class WaresTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @ware = wares(:one)
    sign_in admins(:one)
  end

  test "visiting the index" do
    visit wares_url
    assert_selector "h1", text: "Wares"
  end

  test "creating a Ware" do
    visit wares_url
    click_on "New Ware"

    fill_in "Description", with: @ware.description
    fill_in "Name", with: @ware.name
    fill_in "Price", with: @ware.price_cents
    click_on "Create Ware"

    assert_text "Ware was successfully created"
    click_on "Back"
  end

  test "updating a Ware" do
    visit wares_url
    click_on "Edit", match: :first

    fill_in "Description", with: @ware.description
    fill_in "Name", with: @ware.name
    fill_in "Price", with: @ware.price_cents
    click_on "Update Ware"

    assert_text "Ware was successfully updated"
    click_on "Back"
  end

  test "destroying a Ware" do
    visit wares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ware was successfully destroyed"
  end
end
