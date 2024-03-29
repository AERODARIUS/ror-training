# frozen_string_literal: true

# Controller for managing articles
class ArticlesController < ApplicationController
  def index
    @articles = Article.filter(params.slice(:title, :topic, :user_id, :start_date,
                                            :end_date)).page(params[:page]).order('created_at DESC')
    list_topics
    list_users
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article.id).paginate(page: params[:page]).order('created_at DESC')
  end

  def new
    @article = Article.new
    list_topics
    list_users
  end

  def edit
    @article = Article.find(params[:id])
    list_topics
    list_users
  end

  def create
    @article = Article.new(article_params)
    list_topics
    list_users

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    puts article_params
    puts params
    @article = Article.find(params[:id])
    list_topics
    list_users

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :topic, :user_id)
  end

  def list_topics
    @topics = Article.topics.map { |key, value| [key.titleize, Article.topics.key(value)] }
  end

  def list_users
    @users = User.all.map { |user| [user.name, user.id] }
  end
end
