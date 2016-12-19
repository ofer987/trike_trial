class Country < ActiveRecord::Base
  has_many :currencies

  validates :name, :code, :regular_shipping_rate, :express_shipping_rate, presence: true
end
