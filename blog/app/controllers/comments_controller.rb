# frozen_string_literal: true

# Controller for managing comments
class CommentsController < ApplicationController
  def create
    list_users
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end

  def list_users
    @users = User.all.map { |user| [user.name, user.id] }
  end
end
