class Country < ActiveRecord::Base

  validates_presence_of :name , :code, :regular_shipping_rate, :express_shipping_rate

end
