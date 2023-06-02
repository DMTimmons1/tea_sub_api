class Api::V1::SubscriptionsController < ApplicationController
  before_action :get_customer
  
  def index
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end

  def show
    begin
      render json: SubscriptionSerializer.new(Subscription.find(params[:id]))
    end
  end

  def create 
    begin 
      render json: SubscriptionSerializer.new(@customer.subscriptions.create(subscription_params))
    end
  end

  def update
    begin
      render json: SubscriptionSerializer.new(Subscription.update(params[:id], subscription_params))
    end
  end

  def destroy
    begin
      subscription = Subscription.find(params[:id])
      subscription.tea_subscriptions.destroy_all
      render json: SubscriptionSerializer.new(Subscription.destroy(params[:id]))
    end
  end

private

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  def subscription_params
    params.permit(:customer_id, :title, :price, :status, :frequencey)
  end
end