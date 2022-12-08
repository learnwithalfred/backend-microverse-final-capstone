require 'swagger_helper'

RSpec.describe 'cars', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    @car = FactoryBot.create(:car)
    sign_in @user
  end
  
  path '/cars' do

    get('list cars') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create car') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :car, in: :data, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            image: { type: :string },
            brand: { type: :string },
            duration: { type: :integer },
            total_amount_payable: { type: :integer },
            option_to_purchase_fee: { type: :integer },
            description: { type: :string }
          },
          required: %w[name image brand duration total_amount_payable option_to_purchase_fee description]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/cars/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show car') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update car') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update car') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete car') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/' do

    get('list cars') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.data, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end


require 'rails_helper'

# RSpec.describe 'Cars', type: :request do
#   before(:each) do
#     @user = FactoryBot.create(:user)
#     @car = FactoryBot.create(:car)
#     sign_in @user
#   end

#   describe 'GET /index' do
#     before(:each) do
#       get cars_path
#     end
#     it 'renders a successful response' do
#       expect(response).to be_successful
#     end
#   end

#   describe 'GET /show' do
#     before(:each) do
#       get car_url(@car)
#     end
#     it 'renders a successful response' do
#       expect(response).to be_successful
#     end
#   end

#   describe 'POST /create' do
#     context 'with valid parameters' do
#       it 'creates a new car' do
#         expect do
#           post cars_url, params: { car: {
#             name: 'my first car',
#             image: 'ca',
#             brand: 'car',
#             duration: 8,
#             total_amount_payable: 23,
#             option_to_purchase_fee: 22
#           } }
#         end.to change(Car, :count).by(1)
#       end
#     end

#     context 'with invalid parameters' do
#       it 'does not create a new car' do
#         expect do
#           post cars_url, params: { car: {
#             name: 'my first car',
#             image: 'ca',
#             brand: 'car',
#             duration: 8,
#             total_amount_payable: 23,
#             option_to_purchase_fee: 0
#           } }
#         end.to change(Car, :count).by(0)
#       end

#       it 'renders a response with 422 status' do
#         post cars_url, params: { car: {
#           name: 'my first car',
#           image: 'ca',
#           brand: 'car',
#           duration: 8,
#           total_amount_payable: 23,
#           option_to_purchase_fee: 0
#         } }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end

#   describe 'PATCH /update' do
#     context 'with invalid parameters' do
#       it "renders a response with 422 status (i.e. to display the 'edit' template)" do
#         patch car_url(@car), params: { car: {
#           name: 'my first car',
#           image: 'ca',
#           brand: 'car',
#           duration: 8,
#           total_amount_payable: 23,
#           option_to_purchase_fee: 0
#         } }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end

#   describe 'DELETE /destroy' do
#     it 'destroys the requested car' do
#       expect do
#         delete car_url(@car)
#       end.to change(Car, :count).by(-1)
#     end
#   end
# end
