class Property < ActiveRecord::Base
    validates(:tenant_name, presence: true)
    validates(:tenant_email, presence: true)
    validates(:address, presence: true)
   # validates(:tenant_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: ": Enter Valid Phone Number" })
#    validates(:zipcode, format: { with: /\b\d{5}\b/, message: ": Enter Valid Zip Code" })
end