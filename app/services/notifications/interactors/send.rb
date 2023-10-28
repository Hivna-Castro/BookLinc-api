module Notifications
    module Interactors
        class Send
          include Interactor
          
          def call
            #mail(
            #  to: context.email,
            #  body: context.message 
            #)
          end
        end
    end
end