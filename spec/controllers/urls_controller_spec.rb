require 'spec_helper'

describe UrlsController do
  render_views

  describe "GET 'new'" do

    it 'should be successful' do
      get :new
      response.should be_successful
    end
  end

  describe "POST 'create'" do

    describe "failure" do
      it "should render the 'new' template" do
        response = post :create, :url => { target_url: '' }
        expect(response).to render_template('new')
      end
    end

    describe "success" do
      let(:attr) do
        { target_url: 'http://www.davidwu.com' }
      end

      it 'should create a new Url entry' do
        expect {
          post :create, :url => attr
        }.to change{ Url.count }.by(1)
      end

      it 'should redirect to the Url show page' do
        response = post :create, :url => attr
        response.should redirect_to(url_url(assigns(:url)))
      end
    end
  end
end
