class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  private

    def subscription_params
      params.require(:subscription).permit(:level, :description)
    end

end
