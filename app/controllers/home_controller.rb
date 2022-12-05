class HomeController < ApplicationController
  def index
     @keywords = Keyword.all
     @articles = Article.all
  end
end