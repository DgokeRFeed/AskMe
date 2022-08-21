class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    User.create(user_params)

    redirect_to new_session_path, notice: "Вы успешно зарегестрировались"
  end
end
