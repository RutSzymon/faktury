# encoding: utf-8
class Invoice < ActiveRecord::Base
  PAYMENT_TIME = [7, 14, 21, 30]

  belongs_to :contractor
  has_many :orders
  has_many :products, through: :orders

  validates :contractor, presence: true
  validates :date, presence: true
  validates :payment_time, presence: true, inclusion: { in: PAYMENT_TIME }
  validate :check_date

  accepts_nested_attributes_for :orders, allow_destroy: true

  def to_s
    "Faktura z dnia #{date}"
  end

  def payment_date
    date + payment_time.days
  end

  def sum
    orders.map(&:amount).sum
  end

  def tax_sum
    orders.map(&:tax_amount).sum
  end

  private
  def check_date
    errors.add(:date, "Data jest niepoprawna") if date < Date.today
  end
end