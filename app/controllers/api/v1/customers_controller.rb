class Api::V1::CustomersController < ApplicationController
  def index
    render json: CustomerSerializer.new(Customer.all)
  end

  def show
    customer = Customer.find(params[:id])
    begin
      render json: CustomerSerializer.new(customer)
    end
  end

  def create 
    begin 
      render json: CustomerSerializer.new(Customer.create!(customer_params))
    end
  end

  def update
    begin
      render json: CustomerSerializer.new(Customer.update!(params[:id], customer_params))
    end
  end

  def destroy
    begin
      customer = Customer.find(params[:id])
      customer.subscriptions.destroy_all
      render json: CustomerSerializer.new(Customer.destroy(params[:id]))
    end
  end

private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end