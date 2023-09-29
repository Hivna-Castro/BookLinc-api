# frozen_string_literal: true

class CreateReaders < ActiveRecord::Migration[7.0]
  def change
    create_table :readers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
