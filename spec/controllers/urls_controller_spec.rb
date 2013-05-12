require 'spec_helper'

describe UrlsController do
  render_views

  describe "GET 'new'" do

    it 'should be successful' do
      get :new
      response.should be_successful
    end
  end

  describe "GET 'show'" do

    describe 'success' do
      let(:url) { Url.create!( url: 'https://github.com/dcwu') }

      it 'should redirect to the url' do
        get :visit, :id => url.secret_token
        response.should redirect_to(url.url)
      end
    end

    describe 'failure' do
      it 'should redirect to the new url site' do
        get :visit, :id => 'invalid_secret_token'
        response.should redirect_to(root_url)
      end
    end
  end

  describe "POST 'create'" do

    describe "failure" do
      it "should render the 'new' template" do
        response = post :create, :url => { url: '' }
        expect(response).to render_template('new')
      end
    end

    describe "success" do
      let(:attr) do
        { url: 'http://www.davidwu.com' }
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
