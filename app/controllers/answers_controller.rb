class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '成功！'
    else
      redirect_to question_path(@question), alert: '無効です'
    end
  end
  
  def edit
  end
  
  private
    def answer_params
      params.require(:answer).permit(:content, :name, :question_id)
    end
end
