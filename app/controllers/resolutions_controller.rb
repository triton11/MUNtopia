class ResolutionsController < ApplicationController
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]
  
  # GET /resolutions
  # GET /resolutions.json
  def index
    @groupusers = User.where(organization_id: current_user.organization_id)
    @groupresolutions = []
    @groupusers.each do |item| 
      Resolution.all.each do |addition|
        if (addition.creator == item.id && !(@groupresolutions.include?(addition)))
          @groupresolutions << addition
        end
      end
    end
    puts @groupresolutions
    @resolutions = Resolution.all
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)
    @resolution.creator = current_user.id

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: 'Resolution was successfully created.' }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: 'Resolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
    set_resolution
    unless @resolution.users.exists?(session[:user_id])
      @resolution.users << current_user
      redirect_to @resolution
    end
  end

  def delete_user
    set_resolution
    @resolution.users.destroy(current_user)
    redirect_to @resolution
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolution_params
      params.require(:resolution).permit(:title, :passed, :body)
    end
end
