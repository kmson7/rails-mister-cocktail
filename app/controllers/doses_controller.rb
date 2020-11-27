class DosesController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
  end

  def create
    # raise
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose = Dose.new(dose_params)

    @dose.cocktail = @cocktail
    # @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
