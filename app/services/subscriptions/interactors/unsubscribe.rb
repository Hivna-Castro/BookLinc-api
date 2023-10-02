module Subscriptions
    module Interactors
      class Unsubscribe
        include Interactor
  
        # delegate: :reader, :newsletter, to : context    ## onde chamar reader ou newsletter delega para context
  
        def call
        
          subscription = Subscription.find_by(id: context.subscription_id)
          
          if subscription
            if subscription.destroy
              context.subscription = subscription
              context.message = "Você se desinscreveu na newsletter '#{subscription.news_title}'."
            else
              context.fail!(message: 'Não foi possível desinscrever da newsletter.')
            end
          else
            context.fail!(message: 'Você não está inscrito nesta newsletter.')
          end
          
        end
      end
    end
  end
  