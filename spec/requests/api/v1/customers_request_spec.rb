require 'rails_helper'

RSpec.describe 'Customer API' do
  before do
    @customer_1 = Customer.create!(first_name: "Dawson", last_name: "Timmons", email: "Dawsontimmons@gmail.com", address: "3636 test st.")
    @customer_2 = Customer.create!(first_name: "Scott", last_name: "Timmons", email: "Scotttimmons@gmail.com", address: "36367 test st.")
    @customer_3 = Customer.create!(first_name: "Cindy", last_name: "Timmons", email: "Cindytimmons@gmail.com", address: "36368 test st.")
    @customer_4 = Customer.create!(first_name: "Dylan", last_name: "Timmons", email: "Dylantimmons@gmail.com", address: "36369 test st.")
  end
  describe 'the customer index' do
    it 'returns all the customers' do
      get '/api/v1/customers'

      expect(response).to be_successful
      customers = JSON.parse(response.body, symbolize_names: true)
      expect(customers[:data].count).to eq(4)
      expect(customers[:data][0][:attributes]).to have_key(:first_name)
      expect(customers[:data][0][:attributes]).to have_key(:last_name)
      expect(customers[:data][0][:attributes]).to have_key(:email)
      expect(customers[:data][0][:attributes]).to have_key(:address)
    end
  end

  describe 'the customer show' do
    context 'happy path' do
      it 'returns one customer' do
        get "/api/v1/customers/#{@customer_1.id}"

        expect(response).to be_successful
        customer = JSON.parse(response.body, symbolize_names: true)
        expect(customer[:data][:attributes][:first_name]).to eq(@customer_1.first_name)
        expect(customer[:data][:attributes][:last_name]).to eq(@customer_1.last_name)
        expect(customer[:data][:attributes][:email]).to eq(@customer_1.email)
        expect(customer[:data][:attributes][:address]).to eq(@customer_1.address)
      end
    end
    context 'sad path' do
      it 'returns a 404 if user not found' do
        get '/api/v1/customers/100'

        error = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
      end
    end
  end

  describe 'the customer create' do
    context 'happy path' do 
      it 'creates a customer and posts to the database' do
        customer_params = { first_name: "first name test", last_name: "last name test", email: "test@email.com", address: "test address" }
        post '/api/v1/customers', params: customer_params

        expect(response).to be_successful
        expect(Customer.count).to eq(5)
      end
    end
    context 'sad path' do 
      it 'returns a 404 if the customer is missing params' do
        customer_params = { first_name: "first name test", last_name: "last name test", address: "test address" }
        post '/api/v1/customers', params: customer_params

        error = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(error[:errors][0][:title]).to eq("Validation failed: Email can't be blank")
      end

      it 'returns a 404 if the customer email/address already exists' do
        customer_params = { first_name: "first name test", last_name: "last name test", email: @customer_1.email, address: @customer_1.address }
        post '/api/v1/customers', params: customer_params

        error = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(error[:errors][0][:title]).to eq("Validation failed: Email has already been taken, Address has already been taken")
      end
    end
  end
  describe 'the customer update' do
    context 'happy path' do
      it 'updates the customer with the given params' do
        customer_params = { first_name: "patched first name", last_name: "patched last name" }
        patch "/api/v1/customers/#{@customer_1.id}", params: customer_params

        expect(response).to be_successful
        customer = JSON.parse(response.body, symbolize_names: true)
        expect(customer[:data][:attributes][:first_name]).to eq(customer_params[:first_name])
        expect(customer[:data][:attributes][:last_name]).to eq(customer_params[:last_name])
      end

    context 'sad path' do 
      it 'returns a 404 if the email already exists' do
        customer_params = { email: "Scotttimmons@gmail.com" }
        patch "/api/v1/customers/#{@customer_1.id}", params: customer_params

        error = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(error[:errors][0][:title]).to eq("Validation failed: Email has already been taken")
      end
    end
  end
  describe 'the customer destroy' do
    context 'happy path' do
      it 'can delete a customer' do
        delete "/api/v1/customers/#{@customer_1.id}"

        expect(response).to be_successful
        expect(Customer.count).to eq(3)
      end
    end
    context 'sad path' do
      it 'returns a 404 if user not found' do
        delete "/api/v1/customers/notarealid"

        expect(response.status).to eq(404)
        error = JSON.parse(response.body, symbolize_names: true)
        expect(error[:errors][0][:title]).to eq('Couldn\'t find Customer with \'id\'=notarealid')
      end
    end
  end
end
end