class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    @user = User.new(user_params)
    if @user.save
        auto_login(@user)
        redirect_to '/dashbord', success: 'ユーザー登録が完了しました'
    else
        render :new, status: :unprocessable_entity
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end
end
