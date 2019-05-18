require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
   test "get to root path after sign in" do
     @controller.send(:after_sign_in_path_for,users(:one))
   end
   
   test "get to root path after sign out" do
     @controller.send(:after_sign_out_path_for,users(:one))
   end
   
   test "go to root after resetting password path" do
     @controller.send(:after_resetting_password_path_for,users(:one))
   end
end