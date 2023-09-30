class Subscriptions::Interactors::SendNotificationToReader
    include Interactor

    def call
        message_content = "Olá #{context.reader.name}, voce se desinscreveu na newsletter #{context.newsletter.title}, do autor #{context.author.name}."
        puts message_content
    end
end