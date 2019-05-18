class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
    @user = users(:one)
        #assigns(:user,users(:one))
  end
  
  def valid_facebook_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '123545',
        info: {
          first_name: "Gaius",
          last_name:  "Baltar",
          email:      "test@example.com"
        },
        credentials: {
          token: "123456",
          expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: 'male'
          }
        }
      })
    end
  end
  
  
  test "facebook login" do
    valid_facebook_login_setup
    #get '/users/auth/facebook'
   # @controller.facebook
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end
end