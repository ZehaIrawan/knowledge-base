class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @user = current_user
    @keyword = Keyword.new(keyword_params)

    if @keyword.save
      redirect_to @keyword
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def keyword_params
      params.require(:keyword).permit(:query)
    end
end
