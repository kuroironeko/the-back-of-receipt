require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { { 'name' => user.name } }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: user.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it "returns a success response" do
    get :edit, params: {id: user.to_param}, session: valid_session
    expect(response).to be_success
    end
  end

end
