# frozen_string_literal: true

class Newsletter < ApplicationRecord
  has_many :subscriptions
  has_many :readers, through: :subscription
  belongs_to :author
end
