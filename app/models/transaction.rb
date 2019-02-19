class Transaction < ApplicationRecord
  belongs_to :user
  default_scope -> { order(returned_date: :desc) }
  validates :user_id, presence: true
  validates :stationery_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :needs_return, presence_allow_nil: false
end
