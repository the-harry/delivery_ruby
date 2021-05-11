# frozen_string_literal: true

class Types::OrderType < Types::BaseObject
  field :id, ID, null: false
  field :external_code, String, null: false
  field :store_id, Integer, null: false
  field :sub_total, String, null: false
  field :delivery_fee, String, null: false
  field :total, String, null: false
  field :country, String, null: false
  field :state, String, null: false
  field :city, String, null: false
  field :district, String, null: false
  field :street, String, null: false
  field :complement, String, null: false
  field :latitude, Float, null: false
  field :longitude, Float, null: false
  field :dt_order_create, String, null: false
  field :postal_code, String, null: false
  field :number, String, null: false
  field :total_shipping, Float, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
end
