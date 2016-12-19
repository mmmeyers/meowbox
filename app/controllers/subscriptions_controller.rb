class SubscriptionsController < ApplicationController

  def index
    # @subscriptions = Subscription.all
  end

  def api_index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def show
    @subscription = Subscription.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @subscription }
    end
  end

  private

    def subscription_params
      params.require(:subscription).permit(:level, :description)
    end

end
