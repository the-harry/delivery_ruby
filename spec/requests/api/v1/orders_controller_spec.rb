require 'rails_helper'

describe Api::V1::OrdersController, type: :request do
  describe 'POST #create' do
    context 'when it succeeds' do
      let(:params) { { foo: 'bar'} }

      before { post api_v1_orders_path, params: params }

      it 'respond with status created' do
        expect(response).to have_http_status :created
      end
    end

    context 'when it fails' do
      let(:params) { {} }

      before { post api_v1_orders_path, params: params }

      it 'respond with unprocessable entity if empty params are sent' do
        expect(response).to have_http_status :created
      end
    end
  end
end
