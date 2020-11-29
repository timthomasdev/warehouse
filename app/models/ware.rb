class Ware < ApplicationRecord
  include ActionView::Helpers
  validates :name, :description, :price_cents, presence: true
  has_one :order

  enum status: { available: "available", processing: "processing", sold: "sold" }

  def price
    number_to_currency(price_cents / 100.0)
  end
end