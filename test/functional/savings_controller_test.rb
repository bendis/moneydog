require "test_helper"

class SavingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post user_session_url, params: { email: @user.email, password: "password123" }
  end

  test "new renders a form" do
    get new_saving_url
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='saving[amount]']"
  end

  test "edit renders a form" do
    get edit_saving_url(savings(:one))
    assert_response :success
    assert_select "form", minimum: 1
    assert_select "input[name='saving[amount]']"
  end
end
