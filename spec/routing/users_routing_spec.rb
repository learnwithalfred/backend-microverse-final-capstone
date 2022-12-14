require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PATCH' do
      expect(patch: '/users').to route_to('users/registrations#update')
    end

    it 'routes to #show' do
      expect(get: '/users/edit').to route_to('users/registrations#edit')
    end

    it 'routes to #new' do
      expect(get: '/users/sign_up').to route_to('users/registrations#new')
    end

    it 'routes to #cancel via GET' do
      expect(get: '/users/cancel').to route_to('users/registrations#cancel')
    end

    it 'routes to #create via POST' do
      expect(post: '/users/sign_in').to route_to('users/sessions#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/sign_out').to route_to('users/sessions#destroy')
    end
  end
end
