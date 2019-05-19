require 'test_helper'
class OrderControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:one)
  end
  
  test "should get new" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    get :new
    assert_response :success
  end
  
  test "should show orders page" do 
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    get :orders_page
    assert_response :success
  end
  
  test "should go to view" do 
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
     @controller.session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"", "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"",  "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"","size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
    session[:price_hash] = {"size10b20"=> 5.20,"size14b20"=> 5.20,"size16b24"=> 6.62, "size18b30"=> 7.93,"size12b12"=> 6.62,"size14b24"=> 5.67,"size16b25"=> 4.92, "size20b20"=> 5.20,"size12b20"=> 5.11,"size14b25"=> 5.20,"size18b18"=> 6.62, "size20b24"=> 6.24,"size12b24"=> 6.15,"size14b30"=> 6.62,"size18b20"=> 7.56,"size20b25"=> 5.67,"size12b30"=> 6.62,"size15b20"=> 7.09,"size18b24"=> 6.62, "size20b30"=> 6.62,"size12b36"=> 8.89,"size16b20"=> 5.20,"size18b25"=> 7.09, "size24b24"=> 6.62,"size25b25"=> 7.68}
    old_controller.session[:order] = orders(:one)
    get :view
    assert_response :success
  end
  
  test "should cancel" do 
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    get :cancel, :id => 1
    assert_redirected_to orders_page_path
  end
  
  test "should checkout the user" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"4", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to view_checkout_path
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  test "should not checkout user (invalid filter_freq)" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"12", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to "/properties/add/1"
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  test "should not checkout user (zero order frequency)" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"0", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to "/properties/add/1"
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  test "double zero should go to checkout" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"0", "sub_freq"=>"0", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to view_checkout_path
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  
  test "invalid quantity redirects back to add" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"4", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"-1", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to "/properties/add/1"
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  
  test "invalid quantity redirects back to add (mas de 1000)" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"4", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"1000000", "size12b24"=>"", "size12b30"=>"5", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to "/properties/add/1"
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  
  test "no filters selected redirects back" do
    old_controller = @controller
    @controller = Users::RegistrationsController.new
    post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
    @controller = old_controller
    old_controller.session[:email] = users(:one).email
    old_controller.session[:property] = properties(:one).id
    post :checkout, "order"=>{"start_date"=>"04/23/2019", "filter_freq"=>"4", "sub_freq"=>"4", "size10b20"=>"", "size12b12"=>"", "size12b20"=>"", "size12b24"=>"", "size12b30"=>"", "size12b36"=>"", "size14b20"=>"", "size14b24"=>"", "size14b25"=>"", "size14b30"=>"", "size15b20"=>"", "size16b20"=>"", "size16b24"=>"", "size16b25"=>"", "size18b18"=>"", "size18b20"=>"", "size18b24"=>"", "size18b25"=>"", "size18b30"=>"", "size20b20"=>"", "size20b24"=>"", "size20b25"=>"", "size20b30"=>"", "size24b24"=>"", "size25b25"=>""}
    assert_redirected_to "/properties/add/1"
    #puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    #post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
  
  # test "should go through paypal" do
  #   old_controller = @controller
  #   @controller = Users::RegistrationsController.new
  #   post :create,"user"=>{"first_name"=>"Western Texas College", "last_name"=>"Office", "email"=>"hunterhewitt1@tamu.edu", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
  #   @controller = old_controller
  #   old_controller.session[:email] = users(:one).email
  #   session[:order] = orders(:one)
  #   post :paypal
  # end
end
