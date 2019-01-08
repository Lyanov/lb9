require 'test_helper'

class CalculatorControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get calculator_input_url
    assert_response :success
  end

  test 'should get some res' do
    get calculator_result_url, params: {param: 1}
    assert_equal assigns[:result], [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  test 'should get incorrect res' do
    get calculator_result_url, params: {param: 'hello'}
    assert_equal assigns[:result], 'There is no data or the data is incorrect'
  end

  test 'should get page' do
    get calculator_result_url
    assert_response :success
  end
end
