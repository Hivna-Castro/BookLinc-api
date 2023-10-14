require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#author_name' do
    it "retorne o nome do author" do
      author = Author.create!(name: "Junior")
      book = Book.create!(author: author)
      
      expect(book.author_name).to eq(author.name)
    end
  end
end
