class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :create, :update, :destroy]
  
  def index
    @articles = Article.order(cereated_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end
  
  def create
    @article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "新規投稿しました。"
    else
      render :new, alert: "新規投稿に失敗しました。"
    end
  end

  def edit
  end
  
  def update
    @article.update(article_params)
    if @article.save
      redirect_to articles_path, notice: "更新しました。"
    else
      render :edit, alert: "更新に失敗しました。"
    end
  end
  
  def destroy
    @article.destroy
    redirect_to articles_path, notice: "削除しました。"
  end
  
  private
    def find_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:content)
    end
end
