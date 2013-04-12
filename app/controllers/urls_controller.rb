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
      flash.now[:error] = 'Please enter a valid URL'
      render 'new'
    end
  end
end
