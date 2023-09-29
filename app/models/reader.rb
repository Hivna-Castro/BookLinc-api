# frozen_string_literal: true

class Reader < ApplicationRecord
  has_many :subscriptions
  has_many :newsletter, through: :subscription
end
