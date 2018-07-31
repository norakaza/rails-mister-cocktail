class DosesController < ApplicationController
  def new
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    #@dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:dose_id])
  end



end
