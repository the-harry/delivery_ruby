# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |error|
    render status: :unprocessable_entity,
           json: { errors: error.record.errors.full_messages }
  end
end
