class MovieSummary < ApplicationRecord
  default_scope { where(enabled: true) }
end
