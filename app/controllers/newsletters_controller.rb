class NewsletterController < ApplicationController
    def all
        newsletters = Newsletter.all
        render(json: newsletters.as_json)
    end

    def find
        newsletter = Newsletter.find_by(id: params[:id])
        render(json: newsletter.as_json)
    end

    def create
        newsletter = Newsletter.create(allowed_params)
        render(json: newsletter.as_json)
    end

    def update
        newsletter = Newsletter.find_by(id: params[:id])
        newsletter.update(allowed_params)
        render(json: newsletter.as_json)
    end

    def delete
        newsletter = Newsletter.find_by(id: params[:id])
        render(json: newsletter.destroy.as_json)
    end

    private

    def allowed_params
        params.permit(:title)
    end
end
