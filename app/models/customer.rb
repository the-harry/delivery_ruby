# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :order

  validates :external_id, :name, :email, :contact, presence: true
end
