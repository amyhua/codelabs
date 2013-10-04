class CodepensController < ApplicationController
  # GET /codepens
  # GET /codepens.json
  def index
    @codepens = Codepen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @codepens }
    end
  end

  # GET /codepens/1
  # GET /codepens/1.json
  def show
    @codepen = Codepen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @codepen }
    end
  end

  # GET /codepens/new
  # GET /codepens/new.json
  def new
    @codepen = Codepen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @codepen }
    end
  end

  # GET /codepens/1/edit
  def edit
    @codepen = Codepen.find(params[:id])
  end

  # POST /codepens
  # POST /codepens.json
  def create
    @codepen = Codepen.new(params[:codepen])

    respond_to do |format|
      if @codepen.save
        format.html { redirect_to @codepen, notice: 'Codepen was successfully created.' }
        format.json { render json: @codepen, status: :created, location: @codepen }
      else
        format.html { render action: "new" }
        format.json { render json: @codepen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /codepens/1
  # PUT /codepens/1.json
  def update
    @codepen = Codepen.find(params[:id])

    respond_to do |format|
      if @codepen.update_attributes(params[:codepen])
        format.html { redirect_to @codepen, notice: 'Codepen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @codepen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codepens/1
  # DELETE /codepens/1.json
  def destroy
    @codepen = Codepen.find(params[:id])
    @codepen.destroy

    respond_to do |format|
      format.html { redirect_to codepens_url }
      format.json { head :no_content }
    end
  end
end
