require "rails_helper"

RSpec.describe ProductsIndicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products_indices").to route_to("products_indices#index")
    end

    it "routes to #new" do
      expect(:get => "/products_indices/new").to route_to("products_indices#new")
    end

    it "routes to #show" do
      expect(:get => "/products_indices/1").to route_to("products_indices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/products_indices/1/edit").to route_to("products_indices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/products_indices").to route_to("products_indices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/products_indices/1").to route_to("products_indices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products_indices/1").to route_to("products_indices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/products_indices/1").to route_to("products_indices#destroy", :id => "1")
    end

  end
end
