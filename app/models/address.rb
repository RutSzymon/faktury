# encoding: utf-8
class Address < ActiveRecord::Base
  belongs_to :company

  validates :city, presence: true

  def to_s
     (first_part + comma + second_part).split.join(" ").gsub(" ,", ",")
  end

  private
  def first_part
    "#{street} #{building}#{"/#{unit}" if !unit.empty?}"
  end

  def second_part
    "#{zip_code} #{city}"
  end

  def comma
    (!street.empty? || !building.empty? || !unit.empty?) && (!zip_code.empty? || !city.empty?) ? ", " : ""
  end
end