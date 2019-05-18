require 'test_helper'

class Users::PasswordsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]

    @user = users(:one)
  end
  
    test "it should get new" do
      get :new
    end
   
   test "it should sign in" do
      post :create, :user =>{"first_name"=>"a", "last_name"=>"a", "email"=>"john@tamu.edu"}
   end
   
   test "it should edit" do
      get :edit,  :user =>{"first_name"=>"a", "last_name"=>"a", "email"=>"john@tamu.edu"}
      @controller.edit
   end
   
   test "it should update" do
      put :update
   end
end