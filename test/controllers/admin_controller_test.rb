require 'test_helper'

class AdminControllerTest < ActionController::TestCase
   test "get admin" do
     @controller.session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"", "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"",  "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"","size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
     get :admin
     assert_response :success
   end
   
   test "update_order" do
     @controller.session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"", "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"",  "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"","size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
     put :update_order,  "utf8"=>"✓", "authenticity_token"=>"LN2R3yr3UcZ28dQEBsFiPY0ntK5m66Dll+43HN9kTrGlHvDOSC4OB5JtWz+ghUZkl1sP4utTiXWrYtTDKhvUkw==", "order"=>{"sent_date"=>"04/23/2019", "delivered_date"=>"04/30/2019", "id"=>"1"}, "commit"=>"Save Changes", "id"=>"1"
   end
   
   test "update_order with new year" do
     @controller.session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"", "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"",  "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"","size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
     put :update_order,  "utf8"=>"✓", "authenticity_token"=>"LN2R3yr3UcZ28dQEBsFiPY0ntK5m66Dll+43HN9kTrGlHvDOSC4OB5JtWz+ghUZkl1sP4utTiXWrYtTDKhvUkw==", "order"=>{"sent_date"=>"12/30/2019", "delivered_date"=>"12/31/2019", "id"=>"1"}, "commit"=>"Save Changes", "id"=>"1"
   end
   
   test "update_order with same year" do
     @controller.session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"", "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"",  "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"","size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
     put :update_order,  "utf8"=>"✓", "authenticity_token"=>"LN2R3yr3UcZ28dQEBsFiPY0ntK5m66Dll+43HN9kTrGlHvDOSC4OB5JtWz+ghUZkl1sP4utTiXWrYtTDKhvUkw==", "order"=>{"sent_date"=>"10/30/2019", "delivered_date"=>"11/1/2019", "id"=>"1"}, "commit"=>"Save Changes", "id"=>"1"
   end
end
