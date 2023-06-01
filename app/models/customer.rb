class Customer < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :address
  validates_uniqueness_of :address
  has_many :subscriptions
end
