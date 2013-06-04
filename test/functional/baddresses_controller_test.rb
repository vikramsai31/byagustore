require 'test_helper'

class BaddressesControllerTest < ActionController::TestCase
  setup do
    @baddress = baddresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baddresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baddress" do
    assert_difference('Baddress.count') do
      post :create, baddress: { baddress1: @baddress.baddress1, baddress2: @baddress.baddress2, bcity: @baddress.bcity, bfirst_name: @baddress.bfirst_name, blast_name: @baddress.blast_name, bstate: @baddress.bstate, bzipcode: @baddress.bzipcode, string: @baddress.string, string: @baddress.string }
    end

    assert_redirected_to baddress_path(assigns(:baddress))
  end

  test "should show baddress" do
    get :show, id: @baddress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baddress
    assert_response :success
  end

  test "should update baddress" do
    put :update, id: @baddress, baddress: { baddress1: @baddress.baddress1, baddress2: @baddress.baddress2, bcity: @baddress.bcity, bfirst_name: @baddress.bfirst_name, blast_name: @baddress.blast_name, bstate: @baddress.bstate, bzipcode: @baddress.bzipcode, string: @baddress.string, string: @baddress.string }
    assert_redirected_to baddress_path(assigns(:baddress))
  end

  test "should destroy baddress" do
    assert_difference('Baddress.count', -1) do
      delete :destroy, id: @baddress
    end

    assert_redirected_to baddresses_path
  end
end
