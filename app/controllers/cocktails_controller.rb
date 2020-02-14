class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @doses = Dose.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.name = params["cocktail-name"]
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
