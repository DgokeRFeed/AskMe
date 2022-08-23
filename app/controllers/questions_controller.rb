class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: "Вопрос создан"
    else
      flash.now[:alert] = "Создать вопрос не удалось"
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Вопрос сохранен"
    else
      flash.now[:alert] = "Сохранить вопрос не удалось"
      render :edit
    end
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def show
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Вопрос удален"
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path, notice: "Вопрос скрыт"
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
