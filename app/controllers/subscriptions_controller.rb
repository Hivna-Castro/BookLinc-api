class SubscriptionsController < ApplicationController
    def all
        subscription = Subscription.all
        render(json: subscription.as_json)
      end
    
      def find
        subscription = Subscription.find_by(id: params[:id])
        render(json: subscription.as_json)
      end
    
      def create
        subscription = Subscription.create(allowed_params)
        render(json: subscription.as_json)
      end
    
      def update
        subscription = Subscription.find_by(id: params[:id])
        subscription.update(allowed_params)
        render(json: subscription.as_json)
      end
    
      def delete
        subscription = Subscription.find_by(id: params[:id])
        render(json: subscription.destroy.as_json)+
        
      end
    
      def subscribe_to_newsletter
        # reader = Subscription.find_by(id: params[:reader_id])
        # newsletter = Newsletter.find_by(id: params[:newsletter_id])
        # result = Subscriptions::Organizers::Create.call(reader:, newsletter:)

        result = Subscriptions::Organizers::Create.call(reader_id: params[:reader_id], newsletter_id: params[:newsletter_id])

        if result.success?
          render(json: result.subscription.as_json, status: :ok)
        else
          render(json: { message: result.message }, status: :unprocessable_entity)
        end
      end

      def unsubscribe_to_newsletter
        result = Subscriptions::Organizers::Delete.call(subscription_id: params[:id])
    
        if result.success?
          render (json: result.subscription.as_json, status: :ok)
        else
          render (json: { message: result.message }, status: :unprocessable_entity)
        end
      end
    
      private
    
      def allowed_params
        params.permit(:reader_id, :newsletter_id)
      end

    end




    
end
