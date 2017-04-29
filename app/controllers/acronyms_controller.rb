class AcronymsController < ApplicationController
  def new
    @acronym = Acronym.new
  end

  def create
    @acronym = Acronym.create(acronym_params)
    if @acronym.valid?
      redirect_to acronyms_path
    else
      redirect_to :back
    end
  end

  def import
    Acronym.import(params[:file])
    redirect_to root_url, notice: "data imported."
  end

  def index
    @acronyms = Acronym.search(params[:search]).order("acry asc").paginate(per_page: 10, page: params[:page])
    @wiki = Acronym.get_wiki(@acronyms.first.full_form) if @acronyms.present? && params[:search].present?
  end

  private
  def acronym_params
    params.require(:acronym).permit(:acry, :full_form, :definition)
  end
end
