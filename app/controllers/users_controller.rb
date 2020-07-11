class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created user"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @articles = @user.articles
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User successfully deleted"
      redirect_to root_path
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end