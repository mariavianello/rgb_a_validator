class StringValidatorApi < Sinatra::Base
  use Rack::Parser, :parsers => {
    'application/json' => proc { |data| JSON.parse(data) }
  }

  before do
    response.headers['Access-Control-Allow-Origin']="*"
    response.headers['Access-Control-Allow-Headers']='Content-Type'
  end

  options "*" do
    200
  end

  get '/beep' do
    result = 'BOOP'
    json(:result => result)
  end

  post '/valid_rgb_a' do
    result = StringValidator.valid_rgb_a?(params[:input_string])
    json(:result => result)
  end
end
