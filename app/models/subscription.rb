class Subscription < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequencey
  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
end
