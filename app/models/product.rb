# encoding: utf-8
class Product < ActiveRecord::Base
  TAX = [0, 7, 23]

  validates :name, presence: true
  validates :price, presence: true
  validates :tax, presence: true, inclusion: { in: TAX }

  def to_s
    name
  end

  def price=(value)
    self.price_in_cents = value.to_d*100
  end

  def price
    price_in_cents.to_d/100 if price_in_cents
  end
end