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

  