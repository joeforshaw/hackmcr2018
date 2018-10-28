class User < ApplicationRecord
  validates :phone_number, presence: true
end
