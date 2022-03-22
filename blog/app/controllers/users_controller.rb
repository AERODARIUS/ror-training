# frozen_string_literal: true

# Controller for managing users
class UsersController < ApplicationController
  def index
    @users = User.filter(params.slice(:name, :email, :birthday)).page(params[:page]).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).paginate(page: params[:page]).order('created_at DESC')
    @comments = Comment.where(user_id: @user.id).paginate(page: params[:page]).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :birthday)
  end
end
