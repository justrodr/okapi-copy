class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
    @user = users(:one)
  end
  
  test "it should get facebook" do
    #@controller.facebook
  end
end