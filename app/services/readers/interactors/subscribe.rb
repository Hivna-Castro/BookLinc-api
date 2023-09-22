module Readers
    module Interactors
        class Subscribe
            include Interactor

            def call
                reader = context.reader
                newsletter = context.newsletter
                author = newsletter.author
            
                subscription = Subscription.new(reader: reader, newsletter: newsletter)
            
                if subscription.save
                  context.subscription = subscription
                  context.message = "Você se inscreveu na newsletter #{newsletter.title}."
                  send_notification_to_author(author, reader)
                else
                  context.fail!(message: "Não foi possível se inscrever na newsletter.")
                end
            end
            
            private
            
            def send_notification_to_author(author, reader)
                message_content = "O leitor #{reader.name} se inscreveu na sua newsletter '#{context.newsletter.title}'."
                puts message_content
            end
        end
    end
end