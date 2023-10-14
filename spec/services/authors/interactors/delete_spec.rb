require 'rails_helper'

RSpec.describe(Authors::Interactors::Delete) do

  describe '.call' do
    context 'when the author exists' do
      let(:book) { create(:book) }
      let(:context) { described_class.call(id: book.id) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the author' do
        expect(context.author).to eq(author)
      end

      it 'deletes the author' do
        expect { context }.to change(Author, :count).by(-1)
      end
    end

    context 'when the author does not exist' do
      let(:context) { described_class.call(id: 1) }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context.message).to eq('Não foi encontrado o autor')
      end
    end
  end
end