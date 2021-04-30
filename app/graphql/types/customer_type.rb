module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :external_id, String, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :contact, String, null: false
    field :order_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
