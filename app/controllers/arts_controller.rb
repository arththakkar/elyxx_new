class ArtsController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	logger.warn("====================================================Arts Show")
  	@category = Category.find(params[:id])
  end
end
