class StaticPagesController < ApplicationController
  def index
    @rand = Acronym.order("RANDOM()").first
  end
end
