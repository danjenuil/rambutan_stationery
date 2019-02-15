class Stationery < ApplicationRecord
    before_save { self.product_code = product_code.upcase }
    validates :cupboard_num, presence:true, numericality: { only_integer: true }
    validates :name, presence: true
    validates :product_code, presence: true
end
