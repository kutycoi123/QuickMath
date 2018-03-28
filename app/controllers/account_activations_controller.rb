class AccountActivationsController < ApplicationController

#added @ sign to be consistent with prev implementations - see sessions_controller.rb
#if you want to change back, see listing 11.31

  def edit
    @user = User.find_by(email: params[:email])
    if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
      @user.activate
      log_in @user
      flash[:success] = "Account activated!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to welcome_path
    end
  end
end