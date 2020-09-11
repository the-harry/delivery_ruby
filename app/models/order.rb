# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :customer
  has_many :items
  has_many :payments
end
