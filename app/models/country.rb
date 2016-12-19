class Country < ActiveRecord::Base
  has_many :currencies

  validates :name, :code, presence: true
end
