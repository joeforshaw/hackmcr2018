class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    if @user.save
      flash[:success] = "Thank you ol' chap! You'll receive your first recommendation soon..."
    end
    redirect_to '/'
  end

  private

  def create_params
    params.require(:user).permit(:phone_number)
  end
end
