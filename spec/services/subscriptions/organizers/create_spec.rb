require "rails_helper"

RSpec.describe(Subscriptions::Organizers::Create) do
  describe "#call" do
    it do
      #SETUP
      author = Author.create!(name: "Junior")
      reader = Reader.create!(name: "Leitor 1")
      newsletter = Newsletter.create!(author: author, title: "Laion")

      #Processamento
      result = described_class.call(
        reader: reader,
        newsletter: newsletter
      )

      #Expectativa/Result
      # 1. Se a subscription foi criada
      expect(Subscription.count).to eq(1)
      expect(Subscription.first.reader).to eq(reader)

      # 2. Se a notificacao foi enviada
      expect(result.confirmation).to eq(true)
    end
  end
end