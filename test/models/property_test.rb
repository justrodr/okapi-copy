require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  def setup 
    @property = Property.new(user: 1, prop_name: "Summer Home", tenant_name: "joe", tenant_email: "joe@ss.com", tenant_phone: "8675309",address: "123 Avenue Street", frequency: 1, last_delivered: "Sun, 01 Jan 2012 00:00:00 +0000") 
  end
  #Property.new(user: 1, prop_name: "home", tenant_name: "joe", tenant_email: "joe@ss.com", tenant_phone: "8675309",address: "123 Hell Street", frequency: 1)
  test "property should be valid" do 
    assert @property.valid?
  end
  
  test "enforce tenant's name is present" do 
    @property.tenant_name = "   "
    assert_not @property.valid?
  end
  
  test "enforce tenant email is present" do
    @property.tenant_email = "       "
    assert_not @property.valid?
  end
  
  test "enforce address is present" do 
    @property.address = "   "
    assert_not @property.valid?
  end
end