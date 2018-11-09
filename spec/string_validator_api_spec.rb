RSpec.describe StringValidatorApi do
  include Rack::Test::Methods

  def app
    StringValidatorApi
  end

  describe 'GET /beep' do
    it 'responds with BOOP' do
      get '/beep', 'CONTENT_TYPE' => 'application/json'
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response['result']).to eq('BOOP')
    end
  end

  describe 'POST /valid_rgb_a' do
    it 'validates a string is rgb or rgba ' do
      post '/valid_rgb_a', {:string => 'rgb(0,0,0)'}.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)
      expect(response['result']).to eq(true)
    end
  end
end
