require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return the correct status code' do
      expect(response.status).to eq(200)
    end

    it 'should render the index template' do
      expect(response).to render_template('index')
    end

    it 'includes the correct text' do
      expect(response.body).to include('This are all my conquests detailed')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/1/posts/1'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should return the correct status code' do
      expect(response.status).to eq(200)
    end

    it 'should render the show template' do
      expect(response).to render_template('show')
    end

    it 'includes the correct text' do
      expect(response.body).to include('The Trek To The North')
    end
  end
end
