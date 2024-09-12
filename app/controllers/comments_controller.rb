class CommentsController < ApplicationController
  # BASIC auth, and only allow authenticated users to destory comments
  http_basic_authenticate_with name: "laxit", password: "secret", only: :destory
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
    # puts "params"
    # puts params
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment= @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
