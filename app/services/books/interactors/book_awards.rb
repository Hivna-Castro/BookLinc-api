module Books
    module Interactors
        class BookAwards
            include Interactor
            def call
                result = Books::Interactors::RequestGptInfo.call(prompt: prompt)
                puts result.predictions
            end

            private
            def prompt
                "Liste as dez newsletter mais famosas, atualmente"
            end
        end
    end
end