class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(params)
    redirect_to :new
  end
end
