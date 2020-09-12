# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :set_payload_builder
  before_action :create_order

  def create
    if ProcessOrderService.call(@builder.build!)
      render status: :created
    else
      render status: :service_unavailable
    end
  end

  private

  def set_payload_builder
    @builder = Payload::Builder.new(order_params)
  end

  def create_order
    attributes = @builder.payload
    attributes[:items_attributes].map! { |hash| hash.except!(:sub_items) }

    @order = Order.create!(attributes)
  end

  def order_params
    params.permit(
      :id,
      :store_id,
      :date_created,
      :total_amount,
      :total_shipping,
      :total_amount_with_shipping,
      order_items: [
        :quantity,
        :unit_price,
        :full_unit_price,
        { item: %i[id title] }
      ],
      payments:
        %i[payment_type total_paid_amount],
      shipping: [
        {
          receiver_address:
          [
            :street_name,
            :street_number,
            :comment,
            :zip_code,
            :latitude,
            :longitude,
            {
              city: [:name],
              state: [:id],
              country: [:id],
              neighborhood: [:name]
            }
          ]
        }
      ],
      buyer: [
        :id, :nickname, :email,
        {
          phone: %i[area_code number]
        }
      ]
    )
  end
end
