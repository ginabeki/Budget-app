require 'test_helper'

class ExpenseControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get expense_index_url
    assert_response :success
  end

  test 'should get show' do
    get expense_show_url
    assert_response :success
  end
end
