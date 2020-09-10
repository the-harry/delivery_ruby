# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  def create
    render status: :unprocessable_entity if params.blank?

    render status: :created
  end
end
