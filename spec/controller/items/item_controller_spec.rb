require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  fixtures :items

  describe "#index" do
   it "responds with all items" do
     get :index, format: :json
     items = JSON.parse(response.body)

     expect(response).to be_success
     expect(items.first['name']).to eq 'Bruce'
     expect(items.first['description']).to eq 'Darkness'
     expect(items.last['name']).to eq 'Joker'
    end
  end

  describe "#show" do
    it "responds with an item" do
      item = items(:one)
      get :show, id: item.id, format: :json
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq "Bruce"
      expect(item['description']).to eq 'Darkness'
    end
  end

end
