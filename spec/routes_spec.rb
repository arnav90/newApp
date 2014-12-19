require 'rails_helper'

describe 'routing', type: :routing do
  context 'Drive' do
    it 'should route to #create' do
      expect(post('/drives')).to route_to('drives#create')
    end
    it 'should route to #show' do
      expect(get('/drives/1')).to route_to('drives#show',id: '1')
    end
    it 'should route to #new' do
      expect(get('/drives/new')).to route_to('drives#new')
    end
    it 'should route to #index' do
      expect(get('/drives')).to route_to('drives#index')
    end
  end
end