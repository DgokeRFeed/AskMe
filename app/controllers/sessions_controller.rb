class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email]&.downcase)&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to user_path(user), notice: "Успешный вход"
    else
      flash.now[:alert] = "Неверно введены данные!"

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы вышли из аккаунта"
  end
end
