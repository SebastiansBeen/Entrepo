require 'test_helper'

class FreelancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @freelance = freelances(:one)
  end

  test "should get index" do
    get freelances_url
    assert_response :success
  end

  test "should get new" do
    get new_freelance_url
    assert_response :success
  end

  test "should create freelance" do
    assert_difference('Freelance.count') do
      post freelances_url, params: { freelance: { description: @freelance.description } }
    end

    assert_redirected_to freelance_url(Freelance.last)
  end

  test "should show freelance" do
    get freelance_url(@freelance)
    assert_response :success
  end

  test "should get edit" do
    get edit_freelance_url(@freelance)
    assert_response :success
  end

  test "should update freelance" do
    patch freelance_url(@freelance), params: { freelance: { description: @freelance.description } }
    assert_redirected_to freelance_url(@freelance)
  end

  test "should destroy freelance" do
    assert_difference('Freelance.count', -1) do
      delete freelance_url(@freelance)
    end

    assert_redirected_to freelances_url
  end
end
