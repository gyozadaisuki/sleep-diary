require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should have link" do
    get root_url
    assert_select "a[href=?]","#"
  end
end
