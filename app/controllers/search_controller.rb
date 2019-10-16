class SearchController < ApplicationController
  def index
    @presenter = SearchPresenter.new
  end

  def search_members

  end
end
