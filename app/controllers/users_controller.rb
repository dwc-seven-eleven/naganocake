class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def leave
    @user = User.find(params[:id])
  end

  #退会処理のアクション
  def withdrawl
    @user = User.find(current_user.id)
    #現在ログインしているユーザーを@userに格納
    @user.update(user_status: "退会済")
    #updateで登録情報を退会に変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
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
    params.require(:user).permit(:first_name,:family_name,:family_name_kana,:first_name_kana,:email,:postcode,:first_name,:address,:phone_number,:user_status)
  end

end
