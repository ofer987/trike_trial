class Currency < ActiveRecord::Base
  belongs_to :country

  validates :name, :code, :regular_shipping_rate, :express_shipping_rate, presence: true
end
