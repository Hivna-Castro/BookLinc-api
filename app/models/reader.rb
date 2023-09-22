class Reader < ApplicationRecord
    has_one :subscription
    has_one :newsletter, through: :subscription
end
