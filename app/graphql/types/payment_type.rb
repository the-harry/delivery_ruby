module Types
  class PaymentType < Types::BaseObject
    field :id, ID, null: false
    field :modality, String, null: false
    field :value, Float, null: false
    field :order_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
