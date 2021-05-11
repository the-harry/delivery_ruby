# frozen_string_literal: true

class Types::BaseInputObject < GraphQL::Schema::InputObject
  argument_class Types::BaseArgument
end
