class ArticlesController < ApplicationController
  def index
    @user = current_user
    @keyword = Keyword
    if params[:query].present?
      @articles = Article.where("title like ?", "#{params[:query]}")

      @keyword_exist = Keyword.where(user:current_user).where("query like ?", "#{params[:query].downcase}").any?
      # check if any records value is included in params
      Keyword.find_each do |keyword|
        if "#{params[:query].downcase}".include? keyword.query
          @keyword.find_by(id: "#{keyword.id}").update(:query => "#{params[:query].downcase}")
           p "#{keyword.query} #{keyword.id} LOOK HERE"
        elseif keyword.query.include? "#{params[:query].downcase}"
          # do nothing
          p "PARAMS EXIST IN RECORDS"
        else
          p "CREATE NEW"
          @keyword.create(user: @user, query:"#{params[:query].downcase}" )
        end
      end
      # p "LOOK AT ME #{params[:query].downcase} #{@keyword_exist}"
        # When records query is included in params => replace record with params
        # if @keyword_exist
          # do nothing
        # else
          # @keyword.create(user: @user,query:"#{params[:query].downcase}" )
        # end
      else
        @articles = Article.all
    end
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
