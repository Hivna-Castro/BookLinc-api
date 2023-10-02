module Subscriptions
    module Organizers
        class Create
        include Interactor::Organizer

        organize {
            Subscriptions::Interactors::Subscribe,
            Subscriptions::Interactors::SendNotificationToAuthor
        }

        end

    end
end