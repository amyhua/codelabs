class UsersController < ApplicationController
  before_filter :require_login_from_http_basic, :only => [:login_from_http_basic]
  skip_before_filter :require_login, :only => [:index, :new, :create, :activate, :login_from_http_basic]
  before_filter :require_admin, only: [:admin, :remove_as_admin, :make_as_admin, :destroy]
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        if @user.id == 1
          @user.admin = true
          message = 'You are the first user of this app! Your account is automatically designated as an Admin. Check your email for activation instructions.'
        else
          message = 'Registration successful! Check your email for activation instructions.'
        end
        @user.save
        format.html { redirect_to(:back, :notice => message) }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { redirect_to :back, alert: 'This email has already been taken.' }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def admin
    @lessons = Lesson.all
    @users = User.all
  end

  def request_instructor_help
    admins = User.where(admin: true)
    PhoneMailer.instructor_help_email(current_user,admins).deliver
    render nothing: true
  end

  def remove_as_admin
    @user = User.find(params[:id])
    @user.admin = false
    if @user.save
      redirect_to :back, notice: "User was successfully removed as admin."
    else
      redirect_to :back, alert: "User was not removed as admin. Something went wrong."
    end
  end

  def make_as_admin
    @user = User.find(params[:id])
    @user.admin = true
    if @user.save
      redirect_to :back, notice: "User was successfully made an admin."
    else
      redirect_to :back, alert: "User was not made an admin. Something went wrong."
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    @user.phone = @user.phone.sub('-','').sub(' ','')

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(:back, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to :back }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'User was successfully deleted' }
    end
  end
  
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to(root_url, :notice => 'Your account was successfully activated! You can now login.')
    else
      not_authenticated
    end
  end
  
  # The before filter requires authentication using HTTP Basic,
  # And this action redirects and sets a success notice.
  def login_from_http_basic
    redirect_to root_url, :notice => 'Login from basic auth successful'
  end
end
