# encoding: utf-8
class Invoice < ActiveRecord::Base
  PAYMENT_TIME = [7, 14, 21, 30]

  belongs_to :contractor

  validates :contractor, presence: true
  validates :date, presence: true
  validates :payment_time, presence: true, inclusion: { in: PAYMENT_TIME }
  validate :check_date

  def to_s
    "Faktura z dnia #{date}"
  end

  private
  def check_date
    errors.add(:date, "Data jest niepoprawna") if date < Date.today
  end
end