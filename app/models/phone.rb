class Phone < ApplicationRecord
  belongs_to :company

  enum phone_type: { whatsapp: 0, comercial: 1, outros: 2 }
end
