require 'test_helper'

class AuthenticationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]

    @user = users(:one)
  end
  
  test "destroy" do
    #@controller.destroy
  end
end
