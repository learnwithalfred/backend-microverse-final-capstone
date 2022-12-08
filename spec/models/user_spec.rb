require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'When testing car model' do
    before(:each) do
      @user = FactoryBot.build(:user)
    end

    context 'When passing wrong parameters to the method' do
      it 'should not save the user no name' do
        @user.name = nil
        expect(@user).to_not be_valid
      end

      it 'should not save the user no email' do
        @user.email = nil
        expect(@user).to_not be_valid
      end

      it 'should not save the user no password' do
        @user.password = nil
        expect(@user).to_not be_valid
      end
    end

    context 'When passing valid parameters to the method' do
      it 'should save the user' do
        expect(@user).to be_valid
      end
      it 'should not save the user if email already exist' do
        FactoryBot.create(:user, email: @user.email)
        expect(@user).to_not be_valid
      end
    end

    context 'When testing edge cases with the method' do
      it 'name should not exceed maximum length' do
        @user.name = 'a' * (User::MAX_NAME_LENGTH + 1)
        expect(@user).to_not be_valid
      end

      it 'password should not be less tham minimum length' do
        @user.password = 'a' * (User::MIN_NUM - 1)
        expect(@user).to_not be_valid
      end
    end
  end
end
