class BooksController < ApplicationController
    def all
        books = Book.all
        render(json: books.as_json)
    end

    def find
        book = Book.find_by(id: params[:id])
        render(json: book.as_json)
    end

    def create
        book = Book.create(allowed_params)
        render(json: book.as_json)
    end

    def update
        book = Book.find_by(id: params[:id])
        book.update(allowed_params)
        render(json: book.as_json)
    end

    def delete
        book = Book.find_by(id: params[:id])
        render(json: book.destroy.as_json)
    end

    private

    def allowed_params
        params.permit(:name, :publish_date)
    end
end
