class Company < ApplicationRecord
  belongs_to :category
  belongs_to :member

  has_one_attached :logo

  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  def self.ransackable_attributes(auth_object = nil)
    [
      "name", "zipcode", "address", "number", "neighborhood", "city", "state", "description", "address_map", "latitude", "longitude", "complement", "category_id", "member_id"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "member"]
  end
end
