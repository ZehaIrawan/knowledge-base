class ArticlesController < ApplicationController
  def index
    @user = current_user
    @keyword = Keyword
    if params[:query].present?
      @articles = Article.where("title like ?", "%#{params[:query]}%")
      @keyword.create!(user: @user,query:"#{params[:query]}" )
    else
      @articles = Article.all
    end
    # if turbo_frame_request?
    #   render partial: "articles", locals: { articles: @articles }
    # else
    #   render :index
    # end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
