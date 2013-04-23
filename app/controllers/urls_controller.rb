class UrlsController < ApplicationController

  def new
    @url = Url.new
    @title = "LemmingUrl"
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      redirect_to @url
    else
      flash[:error] = 'Please enter a valid URL'
      redirect_to root_path
    end
  end

  def show
    secret_token = params[:id]
    @url = "0.0.0.0:3000/#{secret_token}"
  end

  # Used for visiting a certain URL using a token.
  def visit
    @url = Url.find_by_secret_token(params[:id])
    if @url
      target_url = @url.target_url
      @url.destroy
      redirect_to target_url
    else
      flash[:error] = 'URL does not exist'
      redirect_to root_path
    end
  end
end
