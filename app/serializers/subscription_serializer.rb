class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :title, :price, :status, :frequencey
end