class Stationery < ApplicationRecord
    validates :cupboard_num, presence:true, numericality: { only_integer: true }
    validates :name, presence: true
    validates :product_code, presence: true
end
