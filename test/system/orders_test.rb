require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  setup do
    @admin = admins(:one)
  end

  test "visiting the index" do
    sign_in @admin
    visit orders_url
    assert_selector "h3", text: "Orders"
  end

  test "successful order displays receipt" do
  
    visit warehouse_index_url
    click_on "Buy now", match: :first

    assert_text "New Order"
    assert_text "Silver Ring"

    fill_in "First name", with: "Tester"
    fill_in "Last name", with: "McTest"
    fill_in "Street address", with: "123 System Test Lane"
    fill_in "City", with: "Capybara"
    fill_in "State", with: "System Test"
    fill_in "Zip code", with: "12345"
    fill_in "Email", with: "test@example.com"
    click_on "Continue to Payment"

    assert_text "test@example.com", wait: 5
    fill_in "cardNumber", with: "4242424242424242"
    fill_in "cardExpiry", with: "424"
    fill_in "cardCvc", with: "424"
    fill_in "billingName", with: "Tester McTest"
    fill_in "billingPostalCode", with: "12345"
    click_on "Pay"

    assert_text "Payment Completed", wait: 5 
    assert_text "Tester McTest"
    assert_text "123 System Test Lane"
    assert_text "Capybara, System Test 12345"
    assert_text "test@example.com"
    assert_text "Silver Ring"
    assert_text wares(:available).description
    assert_text wares(:available).price
    
  end
  
  test "cancellation from Stripe page redirects to new order page" do

    visit warehouse_index_url
    click_on "Buy now", match: :first

    assert_text "New Order"
    assert_text "Silver Ring"

    fill_in "First name", with: "Tester"
    fill_in "Last name", with: "McTest"
    fill_in "Street address", with: "123 System Test Lane"
    fill_in "City", with: "Capybara"
    fill_in "State", with: "System Test"
    fill_in "Zip code", with: "12345"
    fill_in "Email", with: "test@example.com"
    click_on "Continue to Payment"

    assert_text "Pay with card", wait: 5 
    click_on "Back"

    assert_text "New Order"
    assert_text "Silver Ring"
  end

end
