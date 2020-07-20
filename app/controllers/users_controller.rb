class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def leave
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])  
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
   else
    render 'edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name,:family_name,:family_name_kana,:first_name_kana,:email,:postcode,:first_name,:address,:phone_number)
  end

end
