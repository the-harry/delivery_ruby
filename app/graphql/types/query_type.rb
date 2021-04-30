# frozen_string_literal: true

class Types::QueryType < Types::BaseObject
  # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
  include GraphQL::Types::Relay::HasNodeField
  include GraphQL::Types::Relay::HasNodesField

  field :all_customers, [::Types::CustomerType], null: false
  field :all_items, [::Types::ItemType], null: false
  field :all_orders, [::Types::OrderType], null: false
  field :all_payments, [::Types::PaymentType], null: false

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
