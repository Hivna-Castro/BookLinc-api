class Subscriptions::Interactors::SendNotificationToAuthor
    include Interactor

    def call
      Notifications::Organizers::Send.call(email: email, message: message)
      context.confirmation = true
      #raise "Erro ao enviar a notificao"
    end

    private

    def email
      #author.email
      "author@gmail.com"
    end

    def message
      "Olá #{author.name} o leitor #{reader.name} se inscreveu na sua newsletter '#{newsletter.title}" 
    end

    def author
      newsletter.author
    end

    def newsletter
      subscription.newsletter
    end

    def reader
      subscription.reader
    end

    def subscription
      context.subscription
    end

    def reader
      context.reader
    end
end