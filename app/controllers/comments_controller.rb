class CommentsController < ApplicationController

  before_filter :load_article

  def create
    @comment = @article.comments.new(params[:comment])
    if @comment.save
      redirect_to @article, :notice => 'Thank you for your comment'
    else
      render :new, :alert => 'Sorry, we were unable to post your comment'
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, :notice => 'Comment deleted'
  end
  
  private
    def load_article
      @article = Article.find(params[:article_id])
    end

end
