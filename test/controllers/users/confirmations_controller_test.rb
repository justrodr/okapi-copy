require 'test_helper'

class Users::ConfirmationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]

    @user = users(:one)
  end
  
  test "should confirm" do

  end
end