class CodepensController < ApplicationController
  # GET /codepens
  # GET /codepens.json
  def class_index
    @codepens = Codepen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @codepens }
    end
  end

  def index #My Files, Classmates
    @codepens = Codepen.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @codepens }
    end
  end


  def new
    @codepen = Codepen.new

    respond_to do |format|
      format.html # new.html.erb
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
    @codepen.url = @codepen.url.sub('http://cdpn.io/','')
    @codepen.user = current_user

    respond_to do |format|
      if @codepen.save
        format.html { redirect_to class_url, notice: 'Your codepen was successfully submitted to the class.' }
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
        format.html { render action: "index", notice: 'Your codepen submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @codepen.errors, status: :unprocessable_entity }
      end
    end
  end

  def favorite
    @codepen = Codepen.find(params[:id])
    @user = User.find(params[:user_id])
    @user.favorite(@codepen)
    @user.save
      respond_to do |format|
        format.js
      end

  end

  def unfavorite
    @codepen = Codepen.find(params[:id])
    @user = User.find(params[:user_id])
    @user.unfavorite(@codepen)
    @user.save
      respond_to do |format|
        format.js
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
