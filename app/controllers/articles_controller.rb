class ArticlesController < ApplicationController
  before_action :find_article, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :validte_article, only:[:show, :edit, :update, :destroy]
  
  def index
    @articles = current_user.articles.order(cereated_at: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end
  # 新規投稿はしっかりできたかな？
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
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
    
    def validte_article
      if @article.user_id != current_user.id
        redirect_to root_path, alert: "閲覧権限がありません"
      end
    end
end
