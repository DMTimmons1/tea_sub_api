require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "validations" do
    before do
      Customer.create!(first_name: "Dawson", last_name: "Timmons", email: "Dawsontimmons@gmail.com", address: "3636 test st.")
    end

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :address }
    it { should validate_uniqueness_of :address }
  end

  context "relationships" do
    it { should have_many :subscriptions }
  end
end
