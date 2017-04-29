class AcronymsController < ApplicationController
  def new
    @acronym = Acronym.new
  end

  def create
    @acronym = Acronym.create(acronym_params)

  end
  
  def import
    Acronym.import(params[:file])
    redirect_to root_url, notice: "data imported."
  end

  def index
    @acronyms = Acronym.all
  end

  private
  def acronym_params
    params.require(:acronym).permit(:acry, :full_form, :definition)
  end
end
