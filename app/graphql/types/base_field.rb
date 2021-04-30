# frozen_string_literal: true

class Types::BaseField < GraphQL::Schema::Field
  argument_class Types::BaseArgument
end
