class StringValidatorApi < Sinatra::Base
  use Rack::Parser, :parsers => {
    'application/json' => proc { |data| JSON.parse(data) }
  }

  get '/beep' do
    result = 'BOOP'
    json(:result => result)
  end

  post '/valid_rgb_a' do
    result = StringValidator.valid_rgb_a?(params[:string])
    json(:result => result)
  end
end
