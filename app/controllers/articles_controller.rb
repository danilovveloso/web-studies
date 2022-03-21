class ArticlesController < ApplicationController
  def index
   @articles = Article.all.order(created_at: :desc)
   @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html do
          redirect_to articles_path
        end
        format.json { render :show, status: :created, location: @article }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @article, partial: 'article/form', locals: { article: @article }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
