require 'test_helper'

class EnrollmentControllerTest < ActionDispatch::IntegrationTest
  test "should get enroll" do
    get enrollment_enroll_url
    assert_response :success
  end

end
