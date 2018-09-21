require 'rails_helper'

RSpec.describe 'ProductsIndices', type: :request do
  describe 'GET /products_indices' do
    it 'works! (now write some real specs)' do
      get products_indices_path
      expect(response).to have_http_status(200)
    end
  end
end
