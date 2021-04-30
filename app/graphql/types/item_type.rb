module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :external_code, String, null: false
    field :name, String, null: false
    field :price, Float, null: false
    field :quantity, Integer, null: false
    field :total, Float, null: false
    field :order_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
