# encoding: utf-8
class Company < ActiveRecord::Base
  include NipMethods

  has_one :address, dependent: :destroy

  validates :name, presence: true
  validates :person, presence: true
  validates :phone, numericality: true, format: { with: /^(\d{9}|\d{11})$/, multiline: true }

  accepts_nested_attributes_for :address

  def to_s
    name
  end
end