class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    description = params[:dose]['description']
    #need to refac this
  end

  def destroy
  end
end
