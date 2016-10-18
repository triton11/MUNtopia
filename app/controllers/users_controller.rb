class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    unless logged_in? && current_user.name == "Tristrum"
      redirect_to "/"
    end
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def group
    @user = current_user
    @allusers = User.where(organization_id: @user.organization_id)
    puts @users
    render "/users/group"
  end

  # POST /users
  # POST /users.json
  def create
    if (user_params[:code] == Organization.find(user_params[:organization_id].to_i).admincode)
      @user = User.new(user_params)
      @user.admin = true
      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to "/", notice: 'User was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    elsif (user_params[:code] != Organization.find(user_params[:organization_id].to_i).code)
      @user = User.new(user_params)
      @user.errors.add(:code, "Does not match Organization")
      render :new
    else
      @user = User.new(user_params)
      @user.admin = false
      respond_to do |format|
        if @user.save
          session[:user_id] = @user.id
          format.html { redirect_to "/", notice: 'User was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.id == session[:user_id]
      reset_session
    end
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password_hash, :country, :email, :password_hash_confirmation, :name_confirmation, :code, :organization_id)
    end

    def log_in
      session[:user_id] = @user.id
    end
end
