require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'When testing car model' do
    before(:each) do
      @car = FactoryBot.build(:car)
    end

    context 'When passing wrong parameters to the method' do
      it 'should not save the car no name' do
        @car.name = nil
        expect(@car).to_not be_valid
      end

      it 'should not save the car no image' do
        @car.image = nil
        expect(@car).to_not be_valid
      end

      it 'should not save the car no brand' do
        @car.brand = nil
        expect(@car).to_not be_valid
      end

      it 'should not save the car no duration' do
        @car.duration = nil
        expect(@car).to_not be_valid
      end

      it 'should not save the car no total_amount_payable' do
        @car.total_amount_payable = nil
        expect(@car).to_not be_valid
      end

      it 'should not save the car no option_to_purchase_fee' do
        @car.option_to_purchase_fee = nil
        expect(@car).to_not be_valid
      end
    end

    context 'When passing valid parameters to the method' do
      it 'should save the car' do
        expect(@car).to be_valid
      end
    end

    context 'When testing edge cases with the method' do
      it 'name should not exceed maximum length' do
        @car.name = 'a' * (Car::MAX_LENGTH + 1)
        expect(@car).to_not be_valid
      end

      it 'name should not be less tham minimum length' do
        @car.name = 'a' * (Car::MIN_NUM - 1)
        expect(@car).to_not be_valid
      end

      it 'brand should not exceed maximum length' do
        @car.brand = 'a' * (Car::MAX_LENGTH + 1)
        expect(@car).to_not be_valid
      end

      it 'brand should not be less tham minimum length' do
        @car.brand = 'a' * (Car::MIN_NUM - 1)
        expect(@car).to_not be_valid
      end

      it 'image should not be less tham minimum length' do
        @car.image = 'a' * (Car::MIN_NUM - 1)
        expect(@car).to_not be_valid
      end

      it 'duration should not be less tham minimum' do
        @car.duration = Car::MIN_NUM - 1
        expect(@car).to_not be_valid
      end
    end

    context 'When testing edge cases with numbers' do
      it 'total_amount_payable should not be less tham minimum' do
        @car.total_amount_payable = Car::MIN_NUM - 1
        expect(@car).to_not be_valid
      end

      it 'option_to_purchase_fee should not be less tham minimum' do
        @car.option_to_purchase_fee = Car::MIN_NUM - 1
        expect(@car).to_not be_valid
      end

      it 'duration should not be greater tham maximum' do
        @car.duration = Car::MAX_NUM + 1
        expect(@car).to_not be_valid
      end

      it 'total_amount_payable should not be greater tham maximum' do
        @car.total_amount_payable = Car::MAX_NUM + 1
        expect(@car).to_not be_valid
      end

      it 'option_to_purchase_fee should not be greater tham maximum' do
        @car.option_to_purchase_fee = Car::MAX_NUM + 1
        expect(@car).to_not be_valid
      end
    end
  end
end
