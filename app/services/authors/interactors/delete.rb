module Authors
    module Interactors
        class Delete
            include Interactor

            def call
                if author 
                    context.author = author
                    delete_author 
                else
                    context.fail!(message = "Não foi encontrado o autor")
                end
                puts "Estou falando de dentro do interactor Delete"
                context.message = "Deu certo"
            end

            def delete_author
                author.destroy
            end

            def author
                Author.find_by(context.id)
            end
        end
    end
end