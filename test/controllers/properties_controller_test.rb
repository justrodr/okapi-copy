# @controller = SessionsController.new
require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
   test "should get new" do
     get :new
     assert_response :success
   end
   
   test "should create property and redirect to dash_path" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (state invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TeX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (name invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"1111", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (prop name invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (invalid email) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (invalid zipcode) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"7a7494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (invalid address) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (invalid city) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Holleman St", "city"=>"1111", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "two of the same property should not be allowed" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Holleman St", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Holleman St", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}     
      assert_redirected_to dash_path     
   end
   
   
   test "put update should update property" do
      put :update, :id => 1, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "should find from params" do
      get :show,  :id => 1
      assert_response :success
   end
   
   test "post edit should update property" do
      post :edit, :id => Property.first.id 
      assert_response :success
   end
   
   test "delete should destroy an object" do
      delete :destroy, :id => Property.first.id
      assert_redirected_to dash_path
   end
   
   
   
   
   
   
   test "if property not updated (state invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      put :update, :id => 1, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TeX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (name invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      put :update,:id => 1, :property =>{"tenant_name"=>"1111", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (prop name invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      put :update, :id => 1,:property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (invalid zipcode) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      put :update, :id => 1,:property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"7a7494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (invalid address) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      put :update, :id => 1,:property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (invalid city) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      put :update, :id => 1,:property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Holleman St", "city"=>"1111", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "if property not updated (invalid phone) should redirect to dash" do
      controller = @controller
      controller.session[:email] = users(:one).email
      put :update, :id => 1,:property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"111", "tenant_email"=>"hunterhewit@ttamu.edu", "prop_name"=>"11111111111111111111111111", "address"=>"22 Holleman St", "city"=>"katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to edit_property_path(1)
   end
   
   test "post edit should not property" do
      post :edit, :id => 8000
     assert_template "properties/error"
   end
   
   test "post add should not  add property" do
      post :add, :id => 8000
     assert_template "properties/error"
   end
end
