class Base < ApplicationRecord
  
  validates :base_id,  presence: true, length: { maximum: 1000 }, uniqueness: true
  validates :base_name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :base_type,  presence: true, length: { maximum: 50 }
  
end
