class UsersController < ApplicationController
  def new
    # Provide the model instance to the form_for helper
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  # Implement Strong Params
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end