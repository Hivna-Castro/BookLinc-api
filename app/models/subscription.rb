# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :reader
  belongs_to :newsletter

  def news_title
    newsletter.title
  end
end
