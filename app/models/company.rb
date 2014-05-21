# encoding: utf-8
class Company < ActiveRecord::Base
  has_one :address, dependent: :destroy

  validates :name, presence: true

  accepts_nested_attributes_for :address

  def to_s
    name
  end
end