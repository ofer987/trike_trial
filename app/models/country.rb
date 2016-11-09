class Country < ActiveRecord::Base
  validates :name, :code, :regular_shipping_rate, :express_shipping_rate, presence: true
end
