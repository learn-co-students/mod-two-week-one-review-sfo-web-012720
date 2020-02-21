class SeasController < ApplicationController
  #define your controller actions here
  def welcome
    render :welcome
  end

  def index
    @seas = Sea.all 
  end

  def new 
    @sea = Sea.new
  end

  def create 
    @sea = Sea.create(sea_params)
    redirect_to @sea
  end

  def show 
    find_sea
  end

  def edit 
    find_sea
  end

  def update 
    find_sea
    @sea.update(sea_params)
    redirect_to @sea
  end

  def destroy 
    find_sea.destroy
    redirect_to seas_path
  end


  def find_sea
    @sea = Sea.find(params[:id])
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!

  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end


end