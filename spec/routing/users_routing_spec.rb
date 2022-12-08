require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PATCH' do
      expect(patch: '/users').to route_to('users/registrations#update')
    end

    it 'routes to #show' do
      expect(get: '/users/edit').to route_to('users/registrations#edit')
    end

    it 'routes to #create' do
      expect(post: '/users/sign_up').to route_to('users/registrations#new')
    end

end
