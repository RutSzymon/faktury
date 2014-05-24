# encoding: utf-8
class Order < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :product

  validates :product, presence: true
  validates :quantity, presence: true

  def amount
    product.gross_price*quantity
  end

  def tax_amount
    product.tax_rate*quantity
  end
end