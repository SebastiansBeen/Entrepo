class FreelancesController < ApplicationController
  before_action :set_freelance, only: [:show, :edit, :update, :destroy]

  # GET /freelances
  # GET /freelances.json
  def index
    @freelances = Freelance.all
  end

  # GET /freelances/1
  # GET /freelances/1.json
  def show
  end

  # GET /freelances/new
  def new
    @freelance = Freelance.new
  end

  # GET /freelances/1/edit
  def edit
  end

  # POST /freelances
  # POST /freelances.json
  def create
    @freelance = Freelance.new(freelance_params)

    respond_to do |format|
      if @freelance.save
        format.html { redirect_to @freelance, notice: 'Freelance was successfully created.' }
        format.json { render :show, status: :created, location: @freelance }
      else
        format.html { render :new }
        format.json { render json: @freelance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /freelances/1
  # PATCH/PUT /freelances/1.json
  def update
    respond_to do |format|
      if @freelance.update(freelance_params)
        format.html { redirect_to @freelance, notice: 'Freelance was successfully updated.' }
        format.json { render :show, status: :ok, location: @freelance }
      else
        format.html { render :edit }
        format.json { render json: @freelance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freelances/1
  # DELETE /freelances/1.json
  def destroy
    @freelance.destroy
    respond_to do |format|
      format.html { redirect_to freelances_url, notice: 'Freelance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelance
      @freelance = Freelance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def freelance_params
      params.require(:freelance).permit(:description)
    end
end
