require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @car = FactoryBot.create(:car)
    sign_in @user
  end

  describe 'GET /index' do
    before(:each) do
      get cars_path
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before(:each) do
      get car_url(@car)
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new car' do
        expect do
          post cars_url, params: { car: {
            name: 'my first car',
            image: 'ca',
            brand: 'car',
            duration: 8,
            total_amount_payable: 23,
            option_to_purchase_fee: 22
          } }
        end.to change(Car, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new car' do
        expect do
          post cars_url, params: { car: {
            name: 'my first car',
            image: 'ca',
            brand: 'car',
            duration: 8,
            total_amount_payable: 23,
            option_to_purchase_fee: 0
          } }
        end.to change(Car, :count).by(0)
      end

      it 'renders a response with 422 status' do
        post cars_url, params: { car: {
          name: 'my first car',
          image: 'ca',
          brand: 'car',
          duration: 8,
          total_amount_payable: 23,
          option_to_purchase_fee: 0
        } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch car_url(@car), params: { car: {
          name: 'my first car',
          image: 'ca',
          brand: 'car',
          duration: 8,
          total_amount_payable: 23,
          option_to_purchase_fee: 0
        } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested car' do
      expect do
        delete car_url(@car)
      end.to change(Car, :count).by(-1)
    end
  end
end
