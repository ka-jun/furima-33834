class Shipping < ApplicationRecord
  xtend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :charge
  belongs_to :area
  belongs_to :day

  validates :title, :text, presence: true

  validates :charge_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :day_id, numericality: { other_than: 1 } 
end
