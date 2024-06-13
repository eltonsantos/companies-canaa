class Company < ApplicationRecord
  belongs_to :category
  belongs_to :member

  has_one_attached :logo

  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
