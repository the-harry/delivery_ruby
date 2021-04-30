module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :all_customers, [CustomerType], null: false
    field :all_items, [ItemType], null: false
    field :all_orders, [OrderType], null: false
    field :all_payments, [PaymentType], null: false

    def all_customers
      Customer.all
    end

    def all_items
      Item.all
    end

    def all_orders
      Order.all
    end

    def all_payments
      Payment.all
    end
  end
end
