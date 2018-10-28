class MovieName < ApplicationRecord
  default_scope where(enabled: true)
end
