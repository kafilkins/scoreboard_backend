require "test_helper"

class ScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch_data" do
    get scraper_fetch_data_url
    assert_response :success
  end
end
