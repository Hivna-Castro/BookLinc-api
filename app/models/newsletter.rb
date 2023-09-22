class Newsletter < ApplicationRecord
    has_one :subscription
    has_one :reader, through: :subscription
    belongs_to :author
end
