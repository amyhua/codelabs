class QuestionsController < ApplicationController
  before_filter :require_login

  def index
    @questions = Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    unless @question.user == current_user
      redirect_to :back, alert: 'Sorry, you cannot edit a question you did not create.'
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to :back, notice: 'Question was successfully submitted to the classroom Q&A.' }
        format.json { render json: @questions, status: :created, location: @question }
      else
        format.html { render :back, alert: 'Question was not created. Something went wrong.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question was successfully deleted.'
  end

end
