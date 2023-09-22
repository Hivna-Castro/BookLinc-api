class AuthorsController < ApplicationController
    def all
        authors = Author.all
        render(json: authors.as_json)
    end

    def find
        author = Author.find_by(id: params[:id])
        render(json: author.as_json)
    end

    def create
        author = Author.create(allowed_params)
        render(json: author.as_json)
    end

    def update
        author = Author.find_by(id: params[:id])
        author.update(allowed_params)
        render(json: author.as_json)
    end

    def delete
        result = Authors::Interactors::Delete.call(id: params[:id])

        if result.sucess?
            render(json: result.author)
        else
            render(json: { message: result.message }, status: :unprocess)

        # author = Author.find_by(id: params[:id])
        # render(json: author.destroy.as_json)

    end

    private

    def allowed_params
        params.permit(:name, :birth_date)
    end
end
