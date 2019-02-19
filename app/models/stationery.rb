class Stationery < ApplicationRecord
    before_save { self.product_code = product_code.upcase }
    default_scope -> { order(id: :asc) }
    enum stationery_type: [:borrowable, :fixed, :consumable]
    validates :cupboard_num, presence:true, numericality: { only_integer: true }
    validates :quantity, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :name, presence: true
    validates :product_code, presence: true
end
