class AnswersController < ApplicationController

  def create
    @answer = Answer.new(params[:answer])
    @answer.user = current_user
    question = Question.find(params[:question_id])
    @answer.question = question
    if @answer.save
      redirect_to :back, notice: 'Thank you for submitting an answer!'
    else
      redirect_to :back, alert: 'Your answer was not submitted. Answers cannot be blank.'
    end
  end
end
