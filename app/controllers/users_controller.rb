class UsersController < ApplicationController
  def index
  end

  def create
      @user = User.new(user_params)
      if @user.save
          session[:user_id] = @user.id
          redirect_to '/songs'
      else
          redirect_to '/main', alert: @user.errors.full_messages
      end
  end

  def login
      @user = User.find_by_email(params[:email])
      if @user
          if @user.authenticate(params[:password])
              session[:user_id] = @user.id
              redirect_to '/songs'
          else
              redirect_to '/main', alert: ['Invalid password']
          end
      else
          redirect_to '/main', alert: ['Email not found']
      end
  end

  def logout
      session[:user_id] = nil if session[:user_id]
      redirect_to '/main'
  end

  def show
      @user = User.find(params[:id])
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
