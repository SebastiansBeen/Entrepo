class FreesController < ApplicationController
  before_action :set_free, only: [:show, :edit, :update, :destroy]

  # GET /frees
  # GET /frees.json
  def index
    @frees = Free.all
  end

  # GET /frees/1
  # GET /frees/1.json
  def show
  end

  # GET /frees/new
  def new
    @free = Free.new
  end

  # GET /frees/1/edit
  def edit
  end

  # POST /frees
  # POST /frees.json
  def create
    @free = Free.new(free_params)

    respond_to do |format|
      if @free.save
        format.html { redirect_to @free, notice: 'Free was successfully created.' }
        format.json { render :show, status: :created, location: @free }
      else
        format.html { render :new }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frees/1
  # PATCH/PUT /frees/1.json
  def update
    respond_to do |format|
      if @free.update(free_params)
        format.html { redirect_to @free, notice: 'Free was successfully updated.' }
        format.json { render :show, status: :ok, location: @free }
      else
        format.html { render :edit }
        format.json { render json: @free.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frees/1
  # DELETE /frees/1.json
  def destroy
    @free.destroy
    respond_to do |format|
      format.html { redirect_to frees_url, notice: 'Free was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
def create
  @post = Post.new(post_params) do |post|
    post.user = current_user
  end
  if @post.save
    redirect_to root_path
  else
    redirect_to root_path, notice: @post.errors.full_messages.first
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free
      @free = Free.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_params
      params.require(:free).permit(:attachment, :content, :user_id)
    end
end
