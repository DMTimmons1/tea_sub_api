class TeaSubscription < ApplicationRecord
  validates_presence_of :subscription_id
  validates_presence_of :tea_id
  
  belongs_to :subscription
  belongs_to :tea
end
