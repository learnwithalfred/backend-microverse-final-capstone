require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end


  describe 'POST /users' do
    before(:each) do
      get user_session_path
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /users/sign_in' do
    before do
      post user_session_path({ email: 'admin@gmail.com', password: 'password' })
    end

    it 'logs in an existent user successfully' do
      sign_in @user
      get cars_path
      assert_response :success
    end

    it 'returns a 200 status' do
      sign_in @user
      assert_response :success
    end
  end


  describe 'DELETE /users/sign_out' do
    it 'deletes a user successfully' do
      sign_out @user
      get new_user_registration_path
      assert_response :success
    end
  end
end
