require "rails_helper"

RSpec.describe(Subscriptions::Organizers::Create) do
  describe "#call" do
    let(:reader) { create(:reader) }
    let(:newsletter) { create(:newsletter) }

    it do      
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