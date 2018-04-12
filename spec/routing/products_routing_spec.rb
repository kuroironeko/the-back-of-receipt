require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users/1/products").to route_to("products#index", user_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/users/1/products/new").to route_to("products#new", user_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/users/1/products/1").to route_to("products#show", :id => "1", user_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/users/1/products/1/edit").to route_to("products#edit", :id => "1", user_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/users/1/products").to route_to("products#create", user_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1/products/1").to route_to("products#update", :id => "1", user_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1/products/1").to route_to("products#update", :id => "1", user_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1/products/1").to route_to("products#destroy", :id => "1", user_id: '1')
    end

  end
end
