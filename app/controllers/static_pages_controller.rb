class StaticPagesController < ApplicationController
  def index
    @rand = Acronym.order("RANDOM()").first
  end

  def about

  end
end
