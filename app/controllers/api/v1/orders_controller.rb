# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  def create
    builder = PayloadBuilder.new(order_params)
    order = Order.new(builder.payload)

    if order.save
      render status: :created if ProcessOrderService.call(builder.build!)

      render status: :service_unavailable
    else
      render status: :unprocessable_entity, json: { errors: order.errors.full_messages }
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :external_code,
      :store_id,
      :sub_total,
      :delivery_fee,
      :total,
      :country,
      :state,
      :city,
      :district,
      :street,
      :complement,
      :latitude,
      :longitude,
      :dt_order_create,
      :postal_code,
      :number,
      customer_attributtes: %i[
        external_code
        name
        email
        contact
      ],
      items_attributtes: %i[
        external_code
        name
        price
        quantity
        total
      ],
      payments_attributtes: %i[
        type
        value
      ]
    )
  end
end
