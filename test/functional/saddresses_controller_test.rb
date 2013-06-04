require 'test_helper'

class SaddressesControllerTest < ActionController::TestCase
  setup do
    @saddress = saddresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saddresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saddress" do
    assert_difference('Saddress.count') do
      post :create, saddress: { first_name: @saddress.first_name, integer: @saddress.integer, last_name: @saddress.last_name, saddress1: @saddress.saddress1, saddress2: @saddress.saddress2, scity: @saddress.scity, sphone: @saddress.sphone, sstate: @saddress.sstate, string: @saddress.string, string: @saddress.string, szipcode: @saddress.szipcode }
    end

    assert_redirected_to saddress_path(assigns(:saddress))
  end

  test "should show saddress" do
    get :show, id: @saddress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saddress
    assert_response :success
  end

  test "should update saddress" do
    put :update, id: @saddress, saddress: { first_name: @saddress.first_name, integer: @saddress.integer, last_name: @saddress.last_name, saddress1: @saddress.saddress1, saddress2: @saddress.saddress2, scity: @saddress.scity, sphone: @saddress.sphone, sstate: @saddress.sstate, string: @saddress.string, string: @saddress.string, szipcode: @saddress.szipcode }
    assert_redirected_to saddress_path(assigns(:saddress))
  end

  test "should destroy saddress" do
    assert_difference('Saddress.count', -1) do
      delete :destroy, id: @saddress
    end

    assert_redirected_to saddresses_path
  end
end
