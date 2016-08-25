class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @current_user = User.find(params[:id])

    if @subscription.save
      redirect_to subscription_url(@subscription), notice: "Thank you for subscribing"
    else
      render 'new'
    end
  end

  private

    def subscription_params
      params.require(:subscription).permit(:level, :description)
    end

end
