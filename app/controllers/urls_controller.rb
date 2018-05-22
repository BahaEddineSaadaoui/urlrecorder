class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
    @urls = Url.all.order('link ASC')
  end

  def show
  end

  def new
    @url = Url.new
  end

  def create
    if Url.exists?(:link => url_params[:link])
      urls = Url.where(:link => url_params[:link])
      url = non_expired(urls).first
      check(url, url_params)
    else
      record url_params
    end
  end

  def check(url, url_params)
    if !url.nil? && !Url.expired(url)
      redirect_to url, notice: 'Url already exists.'
    else
      record url_params
    end
  end

  def record url_params
    @url = Url.new(url_params)
    @url.content = HTTParty.get(url_params[:link])

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def non_expired urls
    temp = []
    urls.each do |url|
      temp << url if !Url.expired(url)
    end
    temp
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
    end
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:link, :content)
  end
end
