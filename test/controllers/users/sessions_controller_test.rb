require 'test_helper'

class Users::SessionsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:one)
  end
  
  test "it should get new" do
    get :new
  end
  
  test "it should create new" do
    post :create
  end
  
  
end