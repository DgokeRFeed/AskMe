class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy hide]

  def create
    @question = Question.create(question_params)

    redirect_to @question
  end

  def new
    @question = Question.new
  end

  def update
    @question.update(question_params)

    redirect_to @question
  end

  def edit
  end

  def index
    @questions = Question.all
  end

  def show
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def hide
    @question.update(hidden: true)

    redirect_to questions_path
  end

  def hidden?
    question_params[:hidden] == true
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id, :hidden)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
