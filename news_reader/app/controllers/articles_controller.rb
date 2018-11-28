class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      fetch_articles_from_api
    end
  end

  private

  def fetch_articles_from_api
    url = "https://simple-data-storage.herokuapp.com/articles"
    uri = URI(url)

    url_params = { "query" => params[:query]}
    uri.query = URI.encode_www_form(url_params)

    @response = Net::HTTP.get(uri)
    @response = JSON.parse(@response)
  end
end
