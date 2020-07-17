class AdminUsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to admin_user_path(@user)
    end

    private
    def user_params
    	params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :user_status, :member, :unmember)
    end
end
