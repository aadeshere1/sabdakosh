class StaticPagesController < ApplicationController
  def index
    @rand = Acronym.order("RANDOM()").first
    SearchSuggestion.divbyzero
  end

  def about

  end
end
