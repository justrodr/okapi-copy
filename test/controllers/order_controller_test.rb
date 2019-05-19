require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should show orders page" do 
    controller = @controller
    controller.session[:email] = users(:one).email  
    controller.session[:property] = properties(:one)
    get :orders_page
  end
  
  test "should checkout the user" do
    controller = @controller
    controller.session[:email] = users(:one).email  
    controller.session[:property] = properties(:one).id
    #puts controller.session[:property].address
    puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUuu"
    post :checkout, "order"=>{"start_date"=>"", "frequency"=>"0", "size10b20"=>"", "size14b20"=>"", "size16b24"=>"", "size18b30"=>"", "size12b12"=>"", "size14b24"=>"", "size16b25"=>"", "size20b20"=>"", "size12b20"=>"", "size14b25"=>"", "size18b18"=>"", "size20b24"=>"", "size12b24"=>"", "size14b30"=>"", "size18b20"=>"", "size20b25"=>"", "size12b30"=>"", "size15b20"=>"", "size18b24"=>"", "size20b30"=>"", "size12b36"=>"4", "size16b20"=>"", "size18b25"=>"", "size24b24"=>"", "size25b25"=>""}
  end
end
