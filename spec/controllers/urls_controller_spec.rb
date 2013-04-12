require 'spec_helper'

describe UrlsController do
  render_views

  describe "GET 'new'" do

    it 'should be successful' do
      get :new
      response.should be_successful
    end

    # it 'should have the right title' do
    #   get :new
    #   response.should have_selector('title', :content => 'LemmingUrl')
    # end
  end

  describe "POST 'create'" do
    it 'should create a new Url entry'

    it 'should redirect to the Url show page'
  end
end
