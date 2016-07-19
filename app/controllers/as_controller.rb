class AsController < ApplicationController
  before_action :set_a, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show ]


  def index
    @as = A.all
  end


  def show
  end


  def new
    @a = current_user.as.build
  end

 
  def edit
  end


  def create
    @a = current_user.as.build(a_params)
  


      if @a.save
        redirect_to @a, notice: 'A was successfully created.' 
        
      else
        render :new 
       
      end
      end



  def update
  
      if @a.update(a_params)
        redirect_to @a, notice: 'A was successfully updated.' 
       
      else
        render :edit 
      
      end

  end

 
  def destroy
    @a.destroy
    
      redirect_to as_url, notice: 'A was successfully destroyed.' 
      
  end

  private
    
    def set_a
      @a = A.find(params[:id])
    end

    def correct_user
      @a = current_user.as.find_by(id: params[:id])
      redirect_to as_path if @a.nil?
    end

   
    def a_params
      params.require(:a).permit(:description)
    end
end
