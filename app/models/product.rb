# encoding: utf-8
class Product < ActiveRecord::Base
  TAX = [0, 7, 23]

  validates :name, presence: true
  validates :price, presence: true
  validates :tax, presence: true, inclusion: { in: TAX }

  scope :other, -> (products) { where.not(id: products) }

  def to_s
    name
  end

  def price=(value)
    self.price_in_cents = value.to_d*100
  end

  def price
    price_in_cents.to_d/100 if price_in_cents
  end

  def gross_price
    price + tax_rate
  end

  def tax_rate
    price*tax.to_d/100
  end
end