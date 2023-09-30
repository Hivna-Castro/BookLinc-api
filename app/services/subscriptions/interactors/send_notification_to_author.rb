class Subscriptions::Interactors::SendNotificationToAuthor
    include Interactor

    def call
        message_content = "Olá #{context.author.name}, o leitor #{reader.name} se inscreveu na sua newsletter '#{context.newsletter.title}'."
        puts message_content
    end
end