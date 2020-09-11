# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :order

  alias_attribute :external_code, :external_id

  validates :external_id, :name, :email, :contact, presence: true
end
