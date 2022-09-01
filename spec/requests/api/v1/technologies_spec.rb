require 'swagger_helper'

RSpec.describe 'api/v1/technologies', type: :request do

  path '/technologies' do

    post('create technology') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
