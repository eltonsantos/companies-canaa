class Category < ApplicationRecord
  has_many :companies, dependent: :destroy
end
