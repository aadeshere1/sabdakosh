class AcronymsController < ApplicationController
  def new
    @acronym = Acronym.new
  end

  def create
    @acronym = Acronym.create(acronym_params)

  end

  def index
    @acronyms = Acronym.all
  end

  private
  def acronym_params
    params.require(:acronym).permit(:acry, :full_form, :definition)
  end
end
