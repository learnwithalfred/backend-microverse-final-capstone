require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end
