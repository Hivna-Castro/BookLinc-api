module Notifications
    module Organizers
        class Send
          include Interactor::Organizer

          organize(
            Notifications::Interactors::Send
          )
        end
    end
end