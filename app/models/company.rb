# encoding: utf-8
class Company < ActiveRecord::Base
  has_one :address, dependent: :destroy

  validates :address, presence: true
  validates :name, presence: true

  def to_s
    name
  end
end