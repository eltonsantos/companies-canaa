class Category < ApplicationRecord
  has_many :companies, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["companies"]
  end
end
