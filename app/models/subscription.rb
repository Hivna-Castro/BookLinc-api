class Subscription < ApplicationRecord
  belongs_to :reader
  belongs_to :newsletter
end
