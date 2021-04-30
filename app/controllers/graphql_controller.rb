# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = DeliveryRubySchema.execute(query, variables: variables,
                                               context: context,
                                               operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    return {} if variables_param.nil?
    return variables_param.to_unsafe_hash if variables_param == ActionController::Parameters
    return variables_param if variables_param == Hash

    raise ArgumentError, "Unexpected parameter: #{variables_param}" unless variables_param == String

    return {} unless variables_param.present?

    JSON.parse(variables_param) || {}
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: { errors: [{ message: error.message, backtrace: error.backtrace }], data: {} }, status: 500
  end
end
