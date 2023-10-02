class Subscriptions::Interactors::SendNotificationToReader
    include Interactor

    def call
        Notifications::Organizers::Send.call(email: context.subscription.reader.email, message: message)
    end

    private

    def email
      reader.email
    end

    def message
        "Olá #{reader.name}, você se desinscreveu na newsletter #{newsletter.title}"
    end

    def reader
        context.subscription.reader
    end

    def newsletter
        context.subscription.newsletter
    end
end