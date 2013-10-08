class LessonsController < ApplicationController
  before_filter :require_admin, except: [:index, :show]

  def index
    @lessons = Lesson.all
    @past_lessons = Lesson.past
    @upcoming_lessons = Lesson.upcoming
    comics = [
        'http://imgs.xkcd.com/comics/compiling.png',
        'http://imgs.xkcd.com/comics/windows_7.png',
        'http://imgs.xkcd.com/comics/good_code.png',
        'http://imgs.xkcd.com/comics/cell_number.png',
        'http://imgs.xkcd.com/comics/swiftkey.png'
    ]
    @comic = comics.sample
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])
    @next_lesson = Lesson.where("date > ?", @lesson.date ).first
    @prev_lesson = Lesson.where("date < ?", @lesson.date ).last

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.user = current_user
    if params[:draft]
      @lesson.status = "drafted"
    else
      @lesson.status = "published"
    end

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to :back, notice: 'Your lesson was successfully ' + @lesson.status + '!' }
        format.json { render json: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = Lesson.find(params[:id])
    @lesson.status = "published"

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated and published!' }
        format.json { render json: nil, status: :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_draft
    @lesson = Lesson.find(params[:id])
    @lesson.status = "draft"

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to :back, notice: 'Lesson was successfully saved as a draft and has not been published.' }
        format.json { render json: nil, status: :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @lesson = Lesson.find(params[:id])
    @lesson.status = "published"

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to :back, notice: 'Lesson was successfully published!' }
        format.json { render json: nil, status: :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Lesson was successfully deleted.' }
      format.json { render json: nil, status: :ok }
    end
  end
end
