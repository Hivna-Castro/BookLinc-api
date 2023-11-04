# frozen_string_literal: true

module Subscriptions
  module Interactors
    class Subscribe
      include Interactor

      delegate :reader, :newsletter, to: :context    ## onde chamar reader ou newsletter delega para context

      def call
        context.author = newsletter.author

        subscription = Subscription.new(reader: reader, newsletter: newsletter)

        if subscription.save
          context.subscription = subscription
          context.message = "Você se inscreveu na newsletter #{newsletter.title}."
        else
          context.fail!(message: 'Não foi possível se inscrever na newsletter.')
        end
      end

      def rollback
        context.subscription.destroy
      end
    end
  end
end
