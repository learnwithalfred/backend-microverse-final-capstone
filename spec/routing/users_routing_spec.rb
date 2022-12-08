require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PATCH' do
      expect(patch: '/users').to route_to('users/registrations#update')
    end

   
end
