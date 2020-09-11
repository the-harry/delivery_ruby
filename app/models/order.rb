# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :customer
  has_many :items
  has_many :payments

  validates :external_code,
            :store_id,
            :sub_total,
            :delivery_fee,
            :total,
            :country,
            :state,
            :city,
            :district,
            :street,
            :latitude,
            :longitude,
            :dt_order_create,
            :postal_code,
            :number, presence: true
end
