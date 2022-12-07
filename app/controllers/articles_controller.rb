class ArticlesController < ApplicationController
  def index
    @user = current_user
    @keyword = Keyword
    @keywords = @user.keywords
    @show_dropdown = false

    if params[:query].present?
      @show_dropdown = true
      @articles = Article.where("title like ?", "%#{params[:query].downcase}%")

      p "NOT SHOWING #{@articles.length} #{params[:query]} #{@keywords.length}"

      # @keyword_exist = Keyword.where(user: current_user).where("query like ?", "#{params[:query].downcase}").any?
      # check if any records value is included in params

      # if Keyword is empty then create
      if @user.keywords.any?
        @user.keywords.each do |keyword|
          p "#{keyword.query} => ori"
          if params[:query].downcase.include? keyword.query
            # begin
            @keyword.find_by(id: "#{keyword.id}").update(:query => "#{params[:query].downcase}")
            p "#{keyword.query} UPDATE EXISTING KEYWORD"
            # rescue ActiveRecord::RecordInvalid => invalid
            #   puts invalid.record.errors
          end
          if keyword.query.include? params[:query].downcase
            # do nothing
            p "DO NOTHING => PARAMS EXIST IN RECORDS"
          end
          if keyword.query.downcase.exclude? "#{params[:query]}"
            p "CREATE NEW #{keyword.query.exclude? "#{params[:query].downcase}"}"
            p "CREATE NEW2 #{keyword.query} #{"#{params[:query].downcase}"}"
            # bug recording multiple kyword
            # begin
            @keyword.create(user: @user, query: "#{params[:query].downcase}")
            # rescue ActiveRecord::RecordInvalid => invalid
            #   puts invalid.record.errors
            # end
          end
        end
      else
        puts "GOES TO SS"
        @keyword.create(user: @user, query: "#{params[:query].downcase}")
      end
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
