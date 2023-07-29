require 'rails_helper'

require 'swagger_helper'

RSpec.describe 'Posts API', type: :request, swagger_doc: 'v1/swagger.json' do
  path '/api/v1/posts' do
    get 'Retrieves all posts' do
      tags 'Posts'
      produces 'application/json'
      response '200', 'OK' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string }
                 }
               }
        run_test!
      end
    end
  end
end

