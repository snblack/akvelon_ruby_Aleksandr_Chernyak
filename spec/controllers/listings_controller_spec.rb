require "rails_helper"

RSpec.describe ListingsController, :type => :controller do
  describe "GET show" do
    it "has a 200 status code" do
      get :show
      expect(response.status).to eq(200)
    end
    it 'renders show view' do
      get :show
      expect(response).to render_template :show
    end
    it 'assigns new listing ' do
      expect(assigns(:files)).to_not be_instance_of(@files)
    end
  end
end
