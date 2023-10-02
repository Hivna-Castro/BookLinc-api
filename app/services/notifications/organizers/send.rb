module Notifications
    module Organizers
        class Send
          include Interactor::Organizer

          organizer(
            Notifications::Interactors::Send
          )
        end
    end
end