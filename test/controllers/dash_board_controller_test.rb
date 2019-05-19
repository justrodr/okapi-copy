require 'test_helper'

class DashBoardControllerTest < ActionController::TestCase
   test "make splash screen for user" do
     controller = @controller
     controller.session[:email] = users(:one).email
     get :splash
     assert_redirected_to dash_path
   end
   
   test "should skip screen if user logged in" do
     controller = @controller
      controller.session[:email] = users(:one).email
     get :splash
     assert_redirected_to dash_path
   end
   
   test "should get new" do
     controller = @controller
     controller.session[:email] = users(:one).email
     get :new
     assert_response :success
   end
   
   test "user should not be nil" do
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:user).nil?
   end
   
   test "property should not be nil" do 
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:property).nil?
   end
end
