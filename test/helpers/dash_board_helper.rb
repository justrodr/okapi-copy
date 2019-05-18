require 'test_helper'

class DashBoardHelperTest < ActionController::TestCase
     include DashBoardHelper
     test "calls order" do 
         assert_equal sort_link("tenant_name", "Tenant &#8597"), "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
     end
end