module Subscriptions
    module Organizers
        class Delete
        include Interactor::Organizer

        organize {
            Subscriptions::Interactors::Unsubscribe,
            Subscriptions::Interactors::SendNotificationToAuthor
            Subscriptions::Interactors::SendNotificationToReader
        }

        end

    end
end