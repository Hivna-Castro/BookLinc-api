class ReadersController < ApplicationController
    def all
        readers = Reader.all
        render(json: readers.as_json)
    end

    def find
        reader = Reader.find_by(id: params[:id])
        render(json: reader.as_json)
    end

    def create
        reader = Reader.create(allowed_params)
        render(json: reader.as_json)
    end

    def update
        reader = Reader.find_by(id: params[:id])
        reader.update(allowed_params)
        render(json: reader.as_json)
    end

    def delete
        reader = Reader.find_by(id: params[:id])
        render(json: reader.destroy.as_json)
    end

    def subscribe_to_newsletter
        reader = Reader.find_by(id: params[:reader_id]) 
        newsletter = Newsletter.find_by(id: params[:newsletter_id]) 
    
        result = Readers::Interactors::Subscribe.call(reader: reader, newsletter: newsletter)
    
        if result.success?
          flash[:notice] = result.message
          puts flash[:notice]
          redirect_to reader_path(reader)
        else
          flash[:alert] = result.message
          redirect_to newsletter_path(newsletter)
        end
      end
    
    private

    def allowed_params
        params.permit(:name, :email)
    end
end
