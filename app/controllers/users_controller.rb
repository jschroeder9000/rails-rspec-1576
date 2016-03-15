class UsersController < ApplicationController
  def create
    @user = User.create
    UserMailer.welcome(@user).deliver_later
  end
end
