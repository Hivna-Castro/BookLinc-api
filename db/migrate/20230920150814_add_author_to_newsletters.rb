class AddAuthorToNewsletters < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletters, :author, null: false, foreign_key: true
  end
end
