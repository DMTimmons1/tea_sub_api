require 'rails_helper'

RSpec.describe 'Customer Sub API' do
  before do
    @customer = Customer.create!(first_name: "Dawson", last_name: "Timmons", email: "Dawsontimmons@gmail.com", address: "3636 test st.")
    @sub_1 = @customer.subscriptions.create!( title: "Earl Grey Mix", price: 15.99, status: "Active", frequencey: "Monthly" )
    @sub_2 = @customer.subscriptions.create!( title: "Green Mix", price: 7.99, status: "Inactive", frequencey: "Monthly" )
    @sub_3 = @customer.subscriptions.create!( title: "Sleepy Mix", price: 12.99, status: "Active", frequencey: "Monthly" )
  end
  describe 'the customer subcription index' do
    it 'returns all the customers subscriptions' do
      get "/api/v1/customers/#{@customer.id}/subscriptions"

      expect(response).to be_successful
      subscriptions = JSON.parse(response.body, symbolize_names: true)
      expect(subscriptions[:data].count).to eq(3)
      expect(subscriptions[:data][0][:attributes]).to have_key(:title)
      expect(subscriptions[:data][0][:attributes]).to have_key(:price)
      expect(subscriptions[:data][0][:attributes]).to have_key(:status)
      expect(subscriptions[:data][0][:attributes]).to have_key(:frequencey)
    end
  end
  describe 'the customer subcription show' do
    context 'happy path' do
      it 'returns one of the customers subscriptions' do
        get "/api/v1/customers/#{@customer.id}/subscriptions/#{@sub_1.id}"

        expect(response).to be_successful
        customer = JSON.parse(response.body, symbolize_names: true)
        expect(customer[:data][:attributes][:title]).to eq(@sub_1.title)
        expect(customer[:data][:attributes][:price]).to eq(@sub_1.price)
        expect(customer[:data][:attributes][:status]).to eq(@sub_1.status)
        expect(customer[:data][:attributes][:frequencey]).to eq(@sub_1.frequencey)
      end
    end
    context 'sad path' do
      it 'returns a 404 if customers subscription not found' do
        get "/api/v1/customers/#{@customer.id}/subscriptions/notarealsub"

        error = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
      end
    end
  end
  describe 'the customer subscription create' do
    context 'happy path' do 
      it 'creates a customers subscription and posts to the database' do
        sub_params = { title: "sub creation", price: "test", status: "creation", frequencey: "test freq" }
        post "/api/v1/customers/#{@customer.id}/subscriptions/", params: sub_params

        expect(response).to be_successful
        expect(@customer.subscriptions.count).to eq(4)
      end
    end
    context 'sad path' do 
      it 'returns a 404 if the customers subscription is missing params' do
        sub_params = { price: "test", status: "creation", frequencey: "test freq" }
        post "/api/v1/customers/#{@customer.id}/subscriptions/", params: sub_params

        error = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(error[:errors][0][:title]).to eq("Validation failed: Title can't be blank")
      end
    end
  end
  describe 'the customers subscription update' do
    context 'happy path' do
      it 'updates the customer with the given params' do
        sub_params = { title: "sub creation", price: 11.11, status: "creation", frequencey: "test freq" }
        patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@sub_1.id}", params: sub_params

        expect(response).to be_successful
        subscription = JSON.parse(response.body, symbolize_names: true)
        expect(subscription[:data][:attributes][:title]).to eq(sub_params[:title])
        expect(subscription[:data][:attributes][:price]).to eq(sub_params[:price])
        expect(subscription[:data][:attributes][:status]).to eq(sub_params[:status])
        expect(subscription[:data][:attributes][:frequencey]).to eq(sub_params[:frequencey])
      end
    end
  end
  describe 'the customer subscription destroy' do
    context 'happy path' do
      it 'can delete a customers subscription' do
        delete "/api/v1/customers/#{@customer.id}/subscriptions/#{@sub_1.id}"

        expect(response).to be_successful
        expect(@customer.subscriptions.count).to eq(2)
      end
    end
    context 'sad path' do
      it 'returns a 404 if subscription is not found' do
        delete "/api/v1/customers/#{@customer.id}/subscriptions/notarealid"

        expect(response.status).to eq(404)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:errors][0][:title]).to eq('Couldn\'t find Subscription with \'id\'=notarealid')
      end
    end
  end
end