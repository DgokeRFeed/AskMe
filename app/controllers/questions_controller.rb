class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[edit update destroy hide]
  before_action :set_question_for_current_user, only: %i[edit update destroy hide]

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)
    @question.author = current_user
    @question.save

    if @question.save
      redirect_to user_path(@question.user), notice: "Вопрос создан"
    else
      flash.now[:alert] = "Создать вопрос не удалось"
      render :new
    end
  end

  def edit
  end

  def update
    question_params = params.require(:question).permit(:body, :answer, :hidden)
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: "Вопрос сохранен"
    else
      flash.now[:alert] = "Сохранить вопрос не удалось"
      render :edit
    end
  end

  def index
    @question = Question.new
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "Вопрос удален"
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path, notice: "Вопрос скрыт"
  end

  private

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end
end
